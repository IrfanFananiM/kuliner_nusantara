class ListRecipe {
  String? title;
  String? thumb;
  String? key;
  String? times;
  String? portion;
  String? difficulty;

  ListRecipe({
    this.title,
    this.thumb,
    this.key,
    this.times,
    this.portion,
    this.difficulty,
  });

  factory ListRecipe.fromJson(Map<String, dynamic> json) {
    return ListRecipe(
      title: json['title'],
      thumb: json['thumb'],
      key: json['key'],
      times: json['times'],
      portion: json['portion'],
      difficulty: json['difficulty']
    );
  }
}