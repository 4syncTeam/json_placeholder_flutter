class PhotoModel {
  String title;
  String url;
  String thumbnailUrl;

  PhotoModel.fromJson(Map<String, dynamic> m) {
    title = m['title'];
    url = m['url'];
    thumbnailUrl = m['thumbnailUrl'];
  }
}
