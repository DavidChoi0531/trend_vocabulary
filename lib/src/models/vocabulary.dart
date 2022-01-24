class Vocabulary {
  String word;
  String description;

  Vocabulary({
    required this.word,
    required this.description,
  });

  factory Vocabulary.fromJson(Map<String, dynamic> json) {
    return Vocabulary(
      word: json['word'],
      description: json['desc'],
    );
  }

  toJson() {
    return {
      'word': word,
      'desc': description,
    };
  }
}
