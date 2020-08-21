import 'package:flutter/material.dart';
import 'package:jsonplaceholder/model/post_model.dart';

class PostCard extends StatelessWidget {
  Post post;
  PostCard({
    this.post,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      // margin: EdgeInsets.all(12),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            post.body.trim().replaceAll('\n', '').substring(0, 60),
            overflow: TextOverflow.clip,
          )
        ],
      ),
    );
  }
}
