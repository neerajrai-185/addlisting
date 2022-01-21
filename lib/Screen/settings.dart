import 'package:addlisting/Screen/my-ads.dart';
import 'package:addlisting/Screen/profile.dart';
import 'package:addlisting/services.dart/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  Auth _auth = Get.put(Auth());

  openLink(link) async {
    //tel:+9871
    await canLaunch(link) ? launch(link) : throw 'error';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        children: [
          ListTile(
            //  title: Text("Sundaravel"),
            title: Obx(
              () => Text("${_auth.userObj["name"]}"),
            ),
            subtitle: Obx(
              () => Text("${_auth.userObj["mobile"]}"),
            ),

            //subtitle: Text("+919876543210"),
            leading: Obx(
              () => CircleAvatar(
                backgroundImage: NetworkImage("${_auth.userObj["imgURL"]}"),
              ),
              //backgroundImage: NetworkImage(
              //     "https://appmaking.co/wp-content/uploads/2021/08/sundar-grey-bg-300x300.png"),
            ),
            trailing: TextButton(
              onPressed: () {
                Get.to(ProfileScreen());
              },
              child: Text("Edit"),
            ),
          ),
          ListTile(
            onTap: () {
              Get.to(MyAdsScreen());
            },
            title: Text("My Ads"),
            leading: Icon(Icons.post_add),
          ),
          ListTile(
            onTap: () {
              openLink("");
            },
            title: Text("About us"),
            leading: Icon(Icons.person_outline_outlined),
          ),
          ListTile(
              onTap: () {
                openLink("");
              },
              title: Text("Contact Us"),
              leading: Icon(Icons.contacts_outlined))
        ],
      ),
    );
  }
}
