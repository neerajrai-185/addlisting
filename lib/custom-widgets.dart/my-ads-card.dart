import 'package:flutter/material.dart';

class MyAdsCard extends StatelessWidget {
  final String title;
  final double price;
  final String imageURL;
  final String timeAgo;

  const MyAdsCard({
    Key? key,
    required this.title,
    required this.price,
    required this.imageURL,
    required this.timeAgo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(19.0),
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(4.0)),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            child: Image.network(
              imageURL,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "$title",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        size: 12,
                        color: Colors.grey,
                      ),
                      Text(
                        "$timeAgo",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    "$price",
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
