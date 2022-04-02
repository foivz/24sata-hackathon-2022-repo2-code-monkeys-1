// pojedini budget
class Budget {
  final String uid;
  String name;

  Budget(this.uid, this.name);

  Map<String, dynamic> toJson() => {
        'id': uid,
        'name': name,
      };

  static Budget fromJson(Map<String, dynamic> json) => Budget(
        json['id'],
        json['name'],
      );
}
