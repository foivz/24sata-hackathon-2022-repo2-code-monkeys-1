import 'package:flutter/material.dart';
import 'package:monkey/models/category.dart';
import 'package:monkey/pages/shopping_list.dart';
import 'package:monkey/pages/stats.dart';
import 'package:monkey/util/utility.dart';

import '../models/item.dart';

class AddNewItemList extends StatefulWidget {
  const AddNewItemList({Key? key}) : super(key: key);

  @override
  State<AddNewItemList> createState() => _AddNewItemListState();
}

class _AddNewItemListState extends State<AddNewItemList> {
  String name = '';
  int amount = 0;
  Category category = Category("", "");
  final Category placeholder = new Category("uid", "name");
  final controllerName = TextEditingController();
  final controllerAmount = TextEditingController();

  void addItem(String name, int amount) async {
    List<Item> itemsForList = List.empty(growable: true);
    name = controllerName.text;
    amount = int.parse(controllerAmount.text);
    if (name.isNotEmpty || name != "") {
      Utility.database.createItemList(name, itemsForList, placeholder);
      await Utility.refreshData();
    }
    Navigator.pop(context, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          foregroundColor: Colors.grey[600],
          elevation: 0,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Stats()),
                  );
                },
                icon: Icon(Icons.bar_chart_rounded)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShopingListScreen()),
                  );
                },
                icon: Icon(Icons.shopping_bag_outlined)),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.account_balance_wallet)),
          ],
        ),
        body: Center(
          child: Padding(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      labelText: "Enter a name of the new item"),
                  controller: this.controllerName,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "Enter the amount of the item:"),
                  controller: this.controllerAmount,
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                    onPressed: () async {
                      addItem(name, amount);
                    },
                    child: Text("Save item!"))
              ],
            ),
            padding: EdgeInsets.all(10),
          ),
        ));
  }
}
