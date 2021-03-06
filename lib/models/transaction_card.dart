import 'package:monkey/models/category.dart';
import 'package:decimal/decimal.dart';

import '../util/utility.dart';

class TransactionCard {
  final String uid;
  Decimal value;
  String note;
  String categoryId;
  Category category = Category('', '');

  TransactionCard(this.uid, this.value, this.note, this.categoryId) {
    //try{
      if (Utility.categoryList.where((element) => element.uid.compareTo(categoryId) == 0).isNotEmpty)
        category = Utility.categoryList
            .where((element) => element.uid.compareTo(categoryId) == 0)
            .first;
    /*} catch (e){

    }*/

  }

  Map<String, dynamic> toJson() => {
        'id': uid,
        'value': balanceToBase(value),
        'note': note,
        'categoryId': categoryId,
      };

  static TransactionCard fromJson(Map<String, dynamic> json) => TransactionCard(
        json['id'],
        baseToBalance(json['value']),
        json['note'],
        json['categoryId'],
      );

  double balanceToBase(Decimal val) {
    return (val * Decimal.fromInt(100)).toDouble();
  }

  static Decimal baseToBalance(double val) {
    return Decimal.parse(((val) / 100.0).toString());
  }
}
