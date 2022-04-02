import 'package:monkey/database/database.dart';
import 'package:monkey/models/budget.dart';
import 'package:monkey/models/category.dart';
import 'package:monkey/models/transaction_card.dart';

import '../models/group.dart';
import '../models/item.dart';
import '../models/item_list.dart';

class Utility {
  static List<Group> groupList = List.empty(growable: true);
  static List<Category> categoryList = List.empty(growable: true);
  static List<Item> itemList = List.empty(growable: true);
  static List<ItemList> itemListList = List.empty(growable: true);
  static List<TransactionCard> transactionList = List.empty(growable: true);
  static List<Budget> budgetList = List.empty(growable: true);

  static DatabaseService database = DatabaseService();

  static refreshData() async {
    categoryList = await database.readCategories().first;
    itemList = await database.readItems().first;
    itemListList = await database.readItemLists().first;
    transactionList = await database.readTransactions().first;
    budgetList = await database.readBudgets().first;
    groupList = await database.readGroups().first;
  }
}
