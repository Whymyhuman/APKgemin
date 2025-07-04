class Note {
  int? id;
  String title;
  String content;
  DateTime lastModified;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.lastModified,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'lastModified': lastModified.toIso8601String(),
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      lastModified: DateTime.parse(map['lastModified']),
    );
  }
}
