class Category {
  final String uid;
  final String name;

  Category(this.uid, this.name);

  Map<String, dynamic> toJson() => {
        'id': uid,
        'name': name,
      };

  static Category fromJson(Map<String, dynamic> json) => Category(
        json['id'],
        json['name'],
      );

  // funkcija koja vraca icon, switch prema imenu
}
