import 'package:addlisting/Screen/photo-viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AdDetailScreen extends StatelessWidget {
  final String title;
  final double price;
  final String description;
  final List images;
  final String timeAgo;
  final String authorName;
  final String mobile;

  call(mobile) async {
    //tel:+9871
    await canLaunch("tel:$mobile") ? launch("tel:$mobile") : throw 'error';
  }
/*
  void _launchURL() async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}
*/

  AdDetailScreen({
    Key? key,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.timeAgo,
    required this.authorName,
    required this.mobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${this.title}",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "${this.price}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Get.to(PhotoViewerScreen(images: images));
                },
                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(
                    this.images[0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.person_outline_rounded,
                      size: 16,
                    ),
                    Text("${this.authorName}"),
                    SizedBox(width: 16),
                    Icon(
                      Icons.timer_rounded,
                      size: 16,
                    ),
                    Text("${this.timeAgo}"),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                "${this.description}",
                style: TextStyle(
                  height: 1.5,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(elevation: 0),
                  onPressed: () {
                    call(this.mobile);
                  },
                  child: Text("Contact Seller"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
