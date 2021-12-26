class PostModel {
  int userId;
  int id;
  String title;
  String body;

  PostModel({required this.userId, required this.id, required this.title, required this.body});

  PostModel.fromJson(Map<String, dynamic> json):
    userId = json['userId'],
    id = json['id'],
    title = json['title'],
    body = json['body']??null;


Map<String ,dynamic> toJson() => {
    'userId': this.userId,
   'id': this.id,
    'title': this.title,
    'body':this.body
  };
}