class TodoModel {
  String title;
  bool completed;

  TodoModel.fromJson(Map<String, dynamic> m) {
    title = m['title'];
    completed = m['completed'];
  }
}
