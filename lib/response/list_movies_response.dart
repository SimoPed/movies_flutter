class ListMoviesResponse {
  late int id;
  late String name;
  late String genres;
  late dynamic rating;
  late String mediumImage;
  late String summary;
  late String status;

  ListMoviesResponse(
      {required this.id,
      required this.name,
      required this.genres,
      required this.rating,
      required this.mediumImage,
      required this.summary,
      required this.status});

  ListMoviesResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    genres = json['genres'].cast<String>().toString();
    rating = json['rating']['average'];
    mediumImage = json['image']['medium'].toString();
    summary = json['summary'];
    status = json['status'];
  }

// static List<ListMoviesResponse> contentsFromSnapshot(List snapshot) {
//   return snapshot.map((e) {
//     return ListMoviesResponse.fromJson(e);
//   }).toList();
// }
}
