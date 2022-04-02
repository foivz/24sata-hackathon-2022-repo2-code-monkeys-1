import 'package:monkey/models/category.dart';
import 'package:monkey/models/item.dart';
import 'package:monkey/util/utility.dart';

// lista za kupovinu npr
class ItemList {
  final String uid;
  String name;
  List<String> itemIds = List.empty(growable: true);
  List<Item> items = List.empty(growable: true);
  String categoryId;

  ItemList(this.uid, this.name, this.itemIds, this.categoryId) {
    for (String str in itemIds) {
      items.add(Utility.itemList.where((element) => element.uid.compareTo(str) == 0).first);
    }
  }

  Map<String, dynamic> toJson() => {
        'id': uid,
        'name': name,
        'itemIds': '[${itemIds.join(', ')}]',
        'categoryId': categoryId,
      };

  static ItemList fromJson(Map<String, dynamic> json) => ItemList(
        json['id'],
        json['name'],
        getListOfStrings(json['itemIds']),
        json['categoryId'],
      );

  static List<String> getListOfStrings(String str) {
    str = str.substring(1, str.length - 1);
    return str.split(', ');
  }
}
