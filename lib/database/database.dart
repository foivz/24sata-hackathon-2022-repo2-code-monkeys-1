import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:monkey/models/budget.dart';
import 'package:monkey/models/category.dart';
import 'package:monkey/models/group.dart';
import 'package:decimal/decimal.dart';
import 'package:monkey/models/item.dart';
import 'package:monkey/models/item_list.dart';
import 'package:monkey/models/transaction_card.dart';

import '../models/user.dart';

class DatabaseService {

  Future getData(String str) async {
    List categoryList = [];
    CollectionReference collectionRef =
      FirebaseFirestore.instance.collection(str);
    try {
      await collectionRef.get().then((value) {
        for (var res in value.docs) {
          categoryList.add(res.data());
        }
      });
      return categoryList;
    } catch (e) {
      print('dogodio se error!!!!!!!!!!!');
      return null;
    }
  }

  final String dbName = 'database';
  final String dbCategory = 'categories';
  final String dbItem = 'items';
  final String dbItemList = 'itemlists';
  final String dbTransactionCard = 'transactions';
  final String dbBudget = 'budgets';
  final String dbGroup = 'groups';

  DatabaseService();

  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("group");

  // categories

  Future createCategory(String name) {
    final docCategory = FirebaseFirestore.instance.collection(dbCategory).doc();
    final category = Category(docCategory.id, name);
    
    final json = category.toJson();
    return docCategory.set(json);
  }

  Stream<List<Category>> readCategories() => FirebaseFirestore.instance
      .collection(dbCategory)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Category.fromJson(doc.data())).toList());

  Future<Category?> readCategoryById(String id) async {
    final docCategory =
        FirebaseFirestore.instance.collection(dbCategory).doc(id);
    final snapshop = await docCategory.get();

    if (snapshop.exists) {
      return Category.fromJson(snapshop.data()!);
    }
  }

  void deleteCategoryById(String id) {
    final docCategory =
        FirebaseFirestore.instance.collection(dbCategory).doc(id);
    docCategory.delete();
  }

  Future updateCategoryById(Category category) async {
    FirebaseFirestore.instance.collection(dbCategory).doc(category.uid).set({
      'id': category.uid,
      'name': category.name,
    });
  }

  // items

  Future createItem(String name, int amount, String categoryId) {
    final docItem = FirebaseFirestore.instance.collection(dbItem).doc();
    final item = Item(docItem.id, name, amount, categoryId);
    final json = item.toJson();
    return docItem.set(json);
  }

  Stream<List<Item>> readItems() => FirebaseFirestore.instance
      .collection(dbItem)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Item.fromJson(doc.data())).toList());

  Future<Item?> readItemById(String id) async {
    final docItem = FirebaseFirestore.instance.collection(dbItem).doc(id);
    final snapshop = await docItem.get();

    if (snapshop.exists) {
      return Item.fromJson(snapshop.data()!);
    }
  }

  void deleteItemById(String id) {
    final docItem = FirebaseFirestore.instance.collection(dbItem).doc(id);
    docItem.delete();
  }

  Future updateItemById(Item item) async {
    FirebaseFirestore.instance.collection(dbItem).doc(item.uid).set({
      'id': item.uid,
      'name': item.name,
      'amount': item.amount,
      'categoryId': item.categoryId,
    });
  }

  // item lists

  Future createItemList(String name, List<Item> items, Category category) {
    final docItemList = FirebaseFirestore.instance.collection(dbItemList).doc();
    final List<String> itemIds = List.empty(growable: true);
    for (Item item in items) {
      itemIds.add(item.uid);
    }
    final itemList = ItemList(docItemList.id, name, itemIds, category.uid);
    final json = itemList.toJson();
    return docItemList.set(json);
  }

  Stream<List<ItemList>> readItemLists() => FirebaseFirestore.instance
      .collection(dbItemList)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => ItemList.fromJson(doc.data())).toList());

  Future<ItemList?> readItemListById(String id) async {
    final docItemList = FirebaseFirestore.instance.collection(dbItem).doc(id);
    final snapshop = await docItemList.get();

    if (snapshop.exists) {
      return ItemList.fromJson(snapshop.data()!);
    }
  }

  void deleteItemListById(String id) {
    final docItemList =
        FirebaseFirestore.instance.collection(dbItemList).doc(id);
    docItemList.delete();
  }

  Future updateItemListById(ItemList itemList) async {
    FirebaseFirestore.instance
        .collection(dbItemList)
        .doc(itemList.uid)
        .set(itemList.toJson());
  }

  // transactions

  Future createTransaction(Decimal value, String note, Category category) {
    final docTransaction =
        FirebaseFirestore.instance.collection(dbTransactionCard).doc();
    final transaction =
        TransactionCard(docTransaction.id, value, note, category.uid);
    final json = transaction.toJson();
    return docTransaction.set(json);
  }

  Stream<List<TransactionCard>> readTransactions() => FirebaseFirestore.instance
      .collection(dbItemList)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => TransactionCard.fromJson(doc.data()))
          .toList());

  Future<TransactionCard?> readTransactionCardById(String id) async {
    final docTransactionCard =
        FirebaseFirestore.instance.collection(dbItem).doc(id);
    final snapshop = await docTransactionCard.get();

    if (snapshop.exists) {
      return TransactionCard.fromJson(snapshop.data()!);
    }
  }

  void deleteTransactionCardById(String id) {
    final docTransactionCard =
        FirebaseFirestore.instance.collection(dbItemList).doc(id);
    docTransactionCard.delete();
  }

  Future updateTransactionCardById(TransactionCard transactionCard) async {
    FirebaseFirestore.instance
        .collection(dbItemList)
        .doc(transactionCard.uid)
        .set(transactionCard.toJson());
  }

  // budgets

  Future createBudget(String name) {
    final docBudget = FirebaseFirestore.instance.collection(dbBudget).doc();
    final budget = Budget(docBudget.id, name, amount, categoryId);
    final json = budget.toJson();
    return docBudget.set(json);
  }

  Stream<List<Budget>> readBudgets() => FirebaseFirestore.instance
      .collection(dbBudget)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Budget.fromJson(doc.data())).toList());

  Future<Budget?> readBudgetById(String id) async {
    final docBudget = FirebaseFirestore.instance.collection(dbBudget).doc(id);
    final snapshop = await docBudget.get();

    if (snapshop.exists) {
      return Budget.fromJson(snapshop.data()!);
    }
  }

  void deleteBudgetById(String id) {
    final docBudget = FirebaseFirestore.instance.collection(dbBudget).doc(id);
    docBudget.delete();
  }

  Future updateBudgetById(Budget budget) async {
    FirebaseFirestore.instance
        .collection(dbBudget)
        .doc(budget.uid)
        .set(budget.toJson());
  }

  // groups

  Future createGroup(Decimal balance, List<ItemList> itemList,
      List<TransactionCard> transactionList, List<Budget> budgetList,
      bool subscription) {
    final docGroup = FirebaseFirestore.instance.collection(dbGroup).doc();

    final List<String> itemListIds = List.empty(growable: true);
    for (ItemList obj in itemList) {
      itemListIds.add(obj.uid);
    }
    final List<String> transactionListIds = List.empty(growable: true);
    for (TransactionCard obj in transactionList) {
      transactionListIds.add(obj.uid);
    }
    final List<String> budgetListIds = List.empty(growable: true);
    for (Budget obj in budgetList) {
      budgetListIds.add(obj.uid);
    }

    final group = Group(docGroup.id, balance, itemListIds, transactionListIds, budgetListIds, subscription);
    final json = group.toJson();
    return docGroup.set(json);
  }

  Stream<List<Group>> readGroups() => FirebaseFirestore.instance
      .collection(dbGroup)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Group.fromJson(doc.data())).toList());

  Future<Group?> readGroupById(String id) async {
    final docGroup = FirebaseFirestore.instance.collection(dbGroup).doc(id);
    final snapshop = await docGroup.get();

    if (snapshop.exists) {
      return Group.fromJson(snapshop.data()!);
    }
  }

  void deleteGroupById(String id) {
    final docGroup = FirebaseFirestore.instance.collection(dbGroup).doc(id);
    docGroup.delete();
  }

  Future updateGroupById(Group group) async {
    FirebaseFirestore.instance
        .collection(dbGroup)
        .doc(group.uid)
        .set(group.toJson());
  }

  // users

  Future createUser(String id, String name, String email, String photoUrl, String groupId) {
    final docUser = FirebaseFirestore.instance.collection(dbBudget).doc(id);
    final thisuser = User(id, name, email, photoUrl, groupId);
    final json = thisuser.toJson();
    return docUser.set(json);
  }

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection(dbGroup)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
}
