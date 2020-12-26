class Article {
  int id;
  String title;
  String subtitle;

  Article({
    this.id,
    this.title,
    this.subtitle,
  });

  @override
  String toString() {
    return 'Article(id: $id, title: $title, subtitle: $subtitle)';
  }

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json["id"],
      title: json["title"],
      subtitle: json["subtitle"],
    );
  }
}
