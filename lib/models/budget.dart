// pojedini budget
import 'package:decimal/decimal.dart';
import 'package:monkey/models/category.dart';

class Budget {
  final String uid;
  final String name;
  Decimal amount;
  String categoryId;
  Category category = Category('', '');

  Budget(this.uid, this.name, this.amount, this.categoryId) {
    
  }

  Map<String, dynamic> toJson() => {
        'id': uid,
        'name': name,
        'amount': balanceToBase(amount),
        'categoryId': categoryId,
      };

  static Budget fromJson(Map<String, dynamic> json) => Budget(
        json['id'],
        json['name'],
        baseToBalance(json['amount']),
        json['categoryId'],
      );

  double balanceToBase(Decimal val) {
    return (val * Decimal.fromInt(100)).toDouble();
  }

  static Decimal baseToBalance(double val) {
    return Decimal.parse(((val) / 100.0).toString());
  }
}
