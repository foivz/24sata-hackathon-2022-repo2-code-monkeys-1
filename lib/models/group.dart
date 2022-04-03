import 'package:monkey/models/budget.dart';
import 'package:monkey/models/item_list.dart';
import 'package:monkey/models/transaction_card.dart';
import 'package:decimal/decimal.dart';
import 'package:monkey/util/utility.dart';

class Group {
  final String uid;
  Decimal balance;
  List<String> itemListIds;
  List<ItemList> itemList = List.empty(growable: true);
  List<String> transactionIds;
  List<TransactionCard> transactionList = List.empty(growable: true);
  List<String> budgetIds;
  List<Budget> budgetList = List.empty(growable: true);
  bool subscription;

  Group(this.uid, this.balance, this.itemListIds, this.transactionIds,
      this.budgetIds, this.subscription) {
    for (String str in itemListIds) {
      itemList.add(Utility.itemListList
          .where((element) => element.uid.compareTo(str) == 0)
          .first);
    }

    for (String str in transactionIds) {
      transactionList.add(Utility.transactionList
          .where((element) => element.uid.compareTo(str) == 0)
          .first);
    }
    for (String str in budgetIds) {
      budgetList.add(Utility.budgetList
          .where((element) => element.uid.compareTo(str) == 0)
          .first);
    }
  }

  void setSubscription(bool val) {
    subscription = val;
  }

  Map<String, dynamic> toJson() => {
        'id': uid,
        'balance': balanceToBase(balance),
        'itemIds': '[${itemListIds.join(', ')}]',
        'transactionIds': '[${transactionIds.join(', ')}]',
        'budgetIds': '[${budgetIds.join(', ')}]',
        'subscription': subscription,
      };

  static Group fromJson(Map<String, dynamic> json) => Group(
        json['id'],
        baseToBalance(json['balance']),
        getListOfStrings(json['itemIds']),
        getListOfStrings(json['transactionIds']),
        getListOfStrings(json['budgetIds']),
        json['subscription'],
      );

  static List<String> getListOfStrings(String str) {
    str = str.substring(1, str.length - 1);
    return str.split(', ');
  }

  double balanceToBase(Decimal val) {
    return (val * Decimal.fromInt(100)).toDouble();
  }

  static Decimal baseToBalance(double val) {
    return Decimal.parse(((val) / 100.0).toString());
  }
}
