class DetailRecipe {
  String? title;
  String? thumb;
  String? key;
  String? times;
  String? portion;
  String? difficulty;

  DetailRecipe({
    this.title,
    this.thumb,
    this.key,
    this.times,
    this.portion,
    this.difficulty,
  });

  factory DetailRecipe.fromJson(Map<String, dynamic> json) {
    return DetailRecipe(
      title: json['title'],
      thumb: json['thumb'],
      key: json['key'],
      times: json['times'],
      portion: json['portion'],
      difficulty: json['difficulty']
    );
  }
}