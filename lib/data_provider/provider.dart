import 'dart:convert';

import 'package:http/http.dart';
import 'package:jsonplaceholder/config/config.dart';
import 'package:jsonplaceholder/model/photo_model.dart';
import 'package:jsonplaceholder/model/post_model.dart';
import 'package:jsonplaceholder/model/todo_model.dart';

class Provider {
  Future<List<Post>> getPosts() async {
    String url = uri + '/posts';
    print(url);
    Response res = await get(url);
    print(res.body);
    List list = jsonDecode(res.body);
    List<Post> posts = list.map((element) {
      return Post.fromJson(element);
    }).toList();

    return posts;
  }

  Future<List<PhotoModel>> getPhotos() async {
    String url = uri + '/photos';
    Response res = await get(url);
    List list = jsonDecode(res.body);
    List<PhotoModel> photos = list.map((e) {
      return PhotoModel.fromJson(e);
    }).toList();
    print(photos);
    return photos;
  }

  Future<List<TodoModel>> getTodos() async {
    String url = uri + '/todos';
    Response res = await get(url);
    List list = jsonDecode(res.body);
    List<TodoModel> todos = list.map((e) {
      return TodoModel.fromJson(e);
    }).toList();
    print(todos);
    return todos;
  }
}
