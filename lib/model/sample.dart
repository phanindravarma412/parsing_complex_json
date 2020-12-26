import './github.dart';
import './article.dart';
import './contact.dart';

class Sample {
  String name;
  int age;
  List<String> hobbies;
  GitHub gitHub;
  List<Article> articles;
  Map<String, Contact> contact;

  Sample({
    this.name,
    this.age,
    this.hobbies,
    this.gitHub,
    this.articles,
    this.contact,
  });

  @override
  String toString() {
    return 'Sample{name : $name, age : $age, hobbies : $hobbies, github: $gitHub, articles : $articles, contact: $contact}';
  }

  // for single list item

  // @override
  // String toString() {
  //   return 'Sample{name : $name, age : $age, hobbies : ${hobbies[0]}}';
  // }

  // for github name

  // @override
  // String toString() {
  //   return 'Sample{name : $name, age : $age, hobbies : $hobbies, github: ${gitHub.name}}';
  // }

  // to print a item in List<Object>

  //  @override
  // String toString() {
  //   return 'Sample{name : $name, age : $age, hobbies : $hobbies, github: $gitHub, articles : ${articles.map((article) => article.subtitle)}}';
  // }

  // get single item from List<Object> and json with dynamic key Map<String, Map<String, String>>

  // @override
  // String toString() {
  //   return 'Sample{name : $name, age : $age, hobbies : $hobbies, github: $gitHub, articles : ${articles[0]}, contact: ${contact["1"]}}';
  // }

  factory Sample.fromJson(Map<String, dynamic> json) {
    return Sample(
      name: json["name"],
      age: json["age"],
      hobbies: List<String>.from(json['hobbies']),
      gitHub: GitHub.fromJson(json["github"]),
      articles: List<Article>.from(
        json["articles"].map(
          (article) => Article.fromJson(article),
        ),
      ),
      contact: Map.from(json["contact"].map((key, contact) {
        return MapEntry(key, Contact.fromJson(contact));
      })),
    );
  }
}
