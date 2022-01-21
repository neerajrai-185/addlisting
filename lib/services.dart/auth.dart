import 'package:addlisting/Screen/HomeScreen.dart';
import 'package:addlisting/config/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../config/constants.dart';
import 'dart:convert';

class Auth extends GetxController {
  var token = "".obs;
  var userObj = {}.obs;

  login(email, password) {
    var url = Uri.parse(Constants().API_URL + "/auth/login");
    // https://adlisting.herokuapp.com/auth/register

    var input = json.encode({
      "email": email,
      "password": password,
    });

    http
        .post(
      url,
      headers: {"Content-Type": "application/json"},
      body: input,
    )
        .then((res) {
      print(res);
      print(res.body);

      var resp = json.decode(res.body);
      token.value = resp["data"]["token"];
      userObj.assignAll(resp["data"]["user"]);
      Get.offAll(HomeScreen());
    }).catchError((err) {
      print(err);
    });
  }

  register(name, email, mobile, password) {
    var url = Uri.parse(Constants().API_URL + "/auth/register");
    // https://adlisting.herokuapp.com/auth/register

    var input = json.encode({
      "name": name,
      "email": email,
      "password": password,
      "mobile": mobile,
    });

    http
        .post(
      url,
      headers: {"Content-Type": "application/json"},
      body: input,
    )
        .then((res) {
      print(res);
      print(res.body);
    }).catchError((err) {
      print(err);
    });
  }
}
