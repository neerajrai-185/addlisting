import 'package:addlisting/config/constants.dart';
import 'package:addlisting/services.dart/auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../config/constants.dart';
import 'dart:convert';

class Ads extends GetxController {
  Auth _auth = Get.put(Auth());

  fetchAds() async {
    var url = Uri.parse(Constants().API_URL + "/ads");
    return await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    ).then((res) {
      print(res);
      print(res.body);
      var resp = json.decode(res.body);
      var allAds = resp["data"];
      var allAdsExceptMine =
          allAds.where((a) => a["userId"] != _auth.userObj["_id"]).toList();
      return allAdsExceptMine;
    }).catchError((err) {
      print(err);
      return [];
    });
  }

  createAd(input) {
    var url = Uri.parse(Constants().API_URL + "/ads");
    // https://adlisting.herokuapp.com/auth/register

    var body = json.encode(input);

    var token = _auth.token;

    http
        .post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: body,
    )
        .then((res) {
      print(res);
      print(res.body);
      Get.back();
    }).catchError((err) {
      print(err);
    });
  }

  updateAd(input) {
    var url = Uri.parse(Constants().API_URL + "/ads/" + input["_id"]);
    // https://adlisting.herokuapp.com/auth/register

    var body = json.encode(input);

    var token = _auth.token;

    http
        .patch(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: body,
    )
        .then((res) {
      print(res);
      print(res.body);
      Get.back();
    }).catchError((err) {
      print(err);
    });
  }

  deleteAd(input) {
    var url = Uri.parse(Constants().API_URL + "/ads/" + input["_id"]);
    // https://adlisting.herokuapp.com/auth/register

    //var body = json.encode(input);

    var token = _auth.token;

    http.delete(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      //  body: body,
    ).then((res) {
      print(res);
      print(res.body);
      Get.back();
    }).catchError((err) {
      print(err);
    });
  }

  uploadPhotos() async {
    var images = await ImagePicker().pickMultiImage();

    var url = Uri.parse(Constants().API_URL + "/upload/photos");
    var request = http.MultipartRequest("POST", url);

    images!.forEach((image) async {
      request.files
          .add(await http.MultipartFile.fromPath('photos', image.path));
    });

    var res = await request.send();

    var responseData = await res.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(json.decode(responseString));
    var jsonObj = json.decode(responseString);
    print(jsonObj["data"]["path"]);
    return jsonObj["data"]["path"];
  }

  fetchMyAds() async {
    var url = Uri.parse(Constants().API_URL + "/ads/user");
    // https://adlisting.herokuapp.com/auth/register

    var token = _auth.token;

    return await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    ).then((res) {
      print(res);
      print(res.body);
      var resp = json.decode(res.body);

      return resp["data"].toList();
    }).catchError((err) {
      print(err);
      return [];
    });
  }
}
