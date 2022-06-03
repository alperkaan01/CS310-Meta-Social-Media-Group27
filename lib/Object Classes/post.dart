class Post {
  String URL;
  String UserURL;
  String text;
  String date;
  String username;
  int likes;
  int comments;

  Post({
    required this.URL,
    required this.text,
    required this.date,
    required this.UserURL,
    required this.username,
    required this.likes,
    required this.comments,
  });
}
