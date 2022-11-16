class ListMoviesResponse {
  late int id;
  late String name;
  late String genres;
  late dynamic rating;
  late String mediumImage;
  late String originalImage;
  late String summary;

  ListMoviesResponse(
      {required this.id,
      required this.name,
      required this.genres,
      required this.rating,
      required this.mediumImage,
      required this.originalImage,
      required this.summary});

  ListMoviesResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    genres = json['genres'].cast<String>();
    rating = json['rating'];
    mediumImage = json['image'];
    originalImage = json['image'];
    summary = json['summary'];
  }

// static List<ListMoviesResponse> contentsFromSnapshot(List snapshot) {
//   return snapshot.map((e) {
//     return ListMoviesResponse.fromJson(e);
//   }).toList();
// }
}
