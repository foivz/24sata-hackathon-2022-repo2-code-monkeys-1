import 'package:monkey/models/category.dart';
import 'package:monkey/models/item.dart';

// lista za kupovinu npr
class ItemList {
  final String uid;
  String name;
  List<Item> itemList;
  Category category;

  ItemList(this.uid, this.name, this.itemList, this.category);
}
