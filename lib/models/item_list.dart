import 'package:monkey/models/category.dart';
import 'package:monkey/models/item.dart';

// lista za kupovinu npr
class ItemList {
  final String uid;
  String _name;
  List<Item> _itemList = [];
  Category _category;

  ItemList(this.uid, this._name, this._category);

  List<Item> get itemList => _itemList;


  set itemList(List<Item> value) {
    _itemList = value;
  }

  void setItemList(List<Item> value) {
    _itemList = value;
  }

  Category get category => _category;

  set category(Category value) {
    _category = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}
