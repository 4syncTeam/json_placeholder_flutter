class Post {
  int userId;
  int id;
  String title;
  String body;

  Post.fromJson(Map<String, dynamic> m) {
    userId = m['userId'];
    id = m['id'];
    title = m['title'];
    body = m['body'];
  }
}
