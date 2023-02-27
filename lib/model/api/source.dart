class Source {
  final String name;
  final String id;
  Source({required this.name, required this.id});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(name: json['name'], id: json['id']);
  }
}
