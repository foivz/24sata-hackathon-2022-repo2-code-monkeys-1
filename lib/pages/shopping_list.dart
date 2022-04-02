import 'package:flutter/material.dart';
import 'package:monkey/models/category.dart';
import 'package:monkey/models/item_list.dart';

const int numItems = 20;
const TextStyle _biggerFont = TextStyle(fontSize: 18.0);

class ShopingListScreen extends StatelessWidget {
  ShopingListScreen({Key? key}) : super(key: key);
  List<ItemList> testList = List.empty(growable: true);
  //ItemList test1 = ItemList("uid", "Cokolino", Category("kat1", "Food"));

  Widget _buildRow(int idx) {
    return Card(
        child: ListTile(
      leading: CircleAvatar(
        child: Text('$idx'),
      ),
      title: Text(
        'Item $idx',
        style: _biggerFont,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: testList.length + 5,
      itemBuilder: (BuildContext context, int i) {
        if (i == 0) {
          return const Card(
              child: ListTile(
            leading: Icon(Icons.add),
            title: Text(
              'Add new shoping list',
              style: _biggerFont,
            ),
          ));
        } else
          return _buildRow(i);
      },
    ));
  }
}
