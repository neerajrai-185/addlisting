import 'package:addlisting/Screen/ad-detail.dart';
import 'package:addlisting/Screen/manage-ad.dart';
import 'package:addlisting/Screen/settings.dart';
import 'package:addlisting/custom-widgets.dart/ad-card.dart';
import 'package:addlisting/services.dart/ads.dart';
import 'package:addlisting/services.dart/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//  AdsData adsData = AdsData();
  Auth _auth = Get.put(Auth());
  Ads _adsCtrl = Get.put(Ads());

  List _ads = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAds();
  }

  fetchAds() async {
    var resp = await _adsCtrl.fetchAds();
    setState(() {
      _ads = resp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ads Listing"),
        actions: [
          IconButton(
            onPressed: () {
              fetchAds();
            },
            icon: Icon(Icons.refresh),
          ),
          GestureDetector(
            onTap: () {
              Get.to(SettingsScreen());
            },
            child: Obx(
              () => CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage("${_auth.userObj['imgURL']}"),
                //backgroundImage: NetworkImage(
                //    "https://appmaking.co/wp-content/uploads/2021/08/sundar-grey-bg-300x300.png"),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: _ads.length == 0
            ? Container()
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.75),
                itemCount: _ads.length,
                itemBuilder: (bc, index) {
                  var timesAgo =
                      timeago.format(DateTime.parse(_ads[index]["createdAt"]));
                  return GestureDetector(
                    onTap: () {
                      //   var timeAgo = timeago.format(_ads[index]["createdAt"]);
                      Get.to(
                        AdDetailScreen(
                          title: _ads[index]["title"],
                          images: _ads[index]["images"],
                          price: (_ads[index]["price"]).toDouble(),
                          authorName: _ads[index]["authorName"],
                          timeAgo: timesAgo,
                          mobile: _ads[index]["mobile"],
                          description: _ads[index]["description"],
                        ),
                      );
                    },
                    child: AdCard(
                      imageURL: _ads[index]["images"][0],
                      title: _ads[index]["title"],
                      price: (_ads[index]["price"]).toDouble(),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(ManageAdScreen(
            isEdit: false,
            product: {},
          ));
        },
        child: Icon(
          Icons.add_a_photo_outlined,
        ),
      ),
    );
  }
}
