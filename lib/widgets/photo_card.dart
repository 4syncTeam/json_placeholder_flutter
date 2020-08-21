import 'package:flutter/material.dart';
import 'package:jsonplaceholder/model/photo_model.dart';

class PhotoCard extends StatelessWidget {
  PhotoModel photo;

  PhotoCard(this.photo);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      // height: 50,
      // width: 50,
      color: Colors.red,
      child: Stack(
        children: [
          Image.network(photo.url),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              // alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
              child: Text(
                photo.title,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
