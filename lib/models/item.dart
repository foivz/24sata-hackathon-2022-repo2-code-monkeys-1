// iz item liste
import 'package:monkey/models/category.dart';
import 'package:monkey/database/database.dart';
import 'package:monkey/util/utility.dart';

class Item {
  final String uid;
  String name;
  int amount;
  String categoryId;
  Category category = Category('', '');

  Item(this.uid, this.name, this.amount, this.categoryId) {

  }

  Map<String, dynamic> toJson() => {
        'id': uid,
        'name': name,
        'amount': amount,
        'categoryId': categoryId
      };

  static Item fromJson(Map<String, dynamic> json) => Item(
        json['id'],
        json['name'],
        json['amount'],
        json['categoryId'],
      );
}
