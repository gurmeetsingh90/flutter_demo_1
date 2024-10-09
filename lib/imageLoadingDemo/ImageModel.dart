
class ImageModel{

  final dynamic id;
  final dynamic author;
  final dynamic downloadUrl;

  ImageModel({
    required this.id,
    required this.author,
    required this.downloadUrl,
});

  factory ImageModel.fromJson(Map<dynamic, dynamic> json) {
    return ImageModel(
      id: json['id'],
      author: json['author'],
      downloadUrl: json['download_url'],
    );
  }

}