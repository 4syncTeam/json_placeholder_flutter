import 'package:flutter/material.dart';
import 'package:jsonplaceholder/model/photo_model.dart';

class PhotoCard extends StatelessWidget {
  PhotoModel photo;

  PhotoCard(this.photo);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          Image.network(photo.url),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
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
