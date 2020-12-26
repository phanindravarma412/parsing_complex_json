class Contact {
  String name;
  String phone;

  Contact({
    this.name,
    this.phone,
  });

  @override
  String toString() {
    return 'Contact(name: $name, phone: $phone)';
  }

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      name: json["name"],
      phone: json["phone"],
    );
  }
}
