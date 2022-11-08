class ListMoviesResponse {
  int? id;
  String? name;
  List<String>? genres;
  dynamic rating;
  String? image;
  String? summary;

  ListMoviesResponse(
      {this.id,
        this.name,
        this.genres,
        this.rating,
        this.image,
        this.summary});

  ListMoviesResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    genres = json['genres'].cast<String>();
    rating = json['rating'];
    image = json['image'];
    summary = json['summary'];
  }

  static List<ListMoviesResponse> contentsFromSnapshot(List snapshot) {
    return snapshot.map((e) {
      return ListMoviesResponse.fromJson(e);
    }).toList();
  }
}