class Word {
  int id;
  String text;

  Word({required this.id, required this.text});

  factory Word.fromjson(Map<String, dynamic> json) {
    return Word(id: json['id'], text: json['text']);
  }

  toJson() {
    return {
      'id': id,
      'text': text,
    };
  }
}
