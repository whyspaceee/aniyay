class MainMenuModel {
  final int id;
  final String title;
  final String mediaURL;
  final int score;
  final List<dynamic> genres;

  const MainMenuModel._(
      {required this.id,
      required this.title,
      required this.mediaURL,
      required this.score,
      required this.genres});

  factory MainMenuModel.fromJson(Map<String, dynamic> json) {
    return MainMenuModel._(
        id: json['id'] as int,
        title: json['title']['english'] as String? ??
            json['title']['romaji'] as String,
        mediaURL: json['coverImage']['large'] as String,
        score: json['meanScore'] as int,
        genres: json['genres'] as List<dynamic>);
  }
}

class MainMenuModelComplete {
  List<MainMenuModel> popularModel;
  List<MainMenuModel> trendingModel;
  List<MainMenuModel> scoreModel;

  MainMenuModelComplete(
      {required this.popularModel,
      required this.scoreModel,
      required this.trendingModel});
}
