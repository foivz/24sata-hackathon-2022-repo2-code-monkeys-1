// iz item liste
import 'package:monkey/models/category.dart';

class Item {
  final String uid;
  String name;
  int amount;
  Category category;

  Item(this.uid, this.name, this.amount, this.category);
}
