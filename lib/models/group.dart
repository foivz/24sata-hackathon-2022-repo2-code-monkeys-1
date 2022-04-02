import 'package:monkey/models/budget.dart';
import 'package:monkey/models/item_list.dart';
import 'package:monkey/models/transaction.dart';
import 'package:decimal/decimal.dart';

class Group {
  final String _uid;
  Decimal balance;
  List<ItemList> itemListList = List.empty(growable: true);
  List<Transaction> transactionList = List.empty(growable: true);
  List<Budget> budgetList = List.empty(growable: true);
  bool subscription = false;

  Group(this._uid, this.balance);

  void setItemListList(List<ItemList> itemListList) {
    this.itemListList = itemListList;
  }

  void setTransactionList(List<Transaction> transactionList) {
    this.transactionList = transactionList;
  }

  void setBudgetList(List<Budget> budgetList) {
    this.budgetList = budgetList;
  }

  void setSubscription(bool val) {
    subscription = val;
  }

  String get uid {
    return this._uid;
  }
}
