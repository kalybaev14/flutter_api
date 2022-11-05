class PostModel {
  final int id;
  final String title;
  final String imagnetwork;
  final String network;

  PostModel({
    required this.id,
    required this.title,
    required this.imagnetwork,
    required this.network,
  });
  factory PostModel.fromjson(Map<String, dynamic> data) {
    return PostModel(
      id: data['id'],
      title: data['title'],
      imagnetwork: data['url'],
      network: data['thumbnailUrl']
    );
  }
}
