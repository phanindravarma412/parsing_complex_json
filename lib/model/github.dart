class GitHub {
  String name;
  int count;

  GitHub({this.name, this.count});

  @override
  String toString() {
    return 'GitHub(name: $name, count: $count)';
  }

  factory GitHub.fromJson(Map<String, dynamic> json) {
    return GitHub(
      name: json["username"],
      count: json["repo_count"],
    );
  }
}
