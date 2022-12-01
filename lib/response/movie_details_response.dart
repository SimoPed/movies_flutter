class MovieDetailsResponse {
  late int id;
  late String name;
  late String genres;
  late dynamic rating;
  late String originalImage;
  late String summary;
  late String status;

  MovieDetailsResponse({required this.id,
    required this.name,
    required this.genres,
    required this.rating,
    required this.originalImage,
    required this.summary,
    required this.status});

  MovieDetailsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    genres = json['genres'].cast<String>().toString();
    rating = json['rating']['average'];
    originalImage = json['image']['original'].toString();
    summary = json['summary'];
    status = json['status'];
  }
}