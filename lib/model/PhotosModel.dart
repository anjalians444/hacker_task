class PhotosModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  PhotosModel({required this.albumId, required this.id, required this.title, required this.url, required this.thumbnailUrl});

  PhotosModel.fromJson(Map<String, dynamic> json):
    albumId = json['albumId'],
    id = json['id'],
    title = json['title'],
    url = json['url'],
    thumbnailUrl = json['thumbnailUrl']??null;


  Map<String, dynamic> toJson() =>{
 'albumId': this.albumId,
    'id':this.id,
    'title':this.title,
   'url':this.url,
    'thumbnailUrl': this.thumbnailUrl

  };
}