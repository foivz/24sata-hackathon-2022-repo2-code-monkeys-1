import 'package:flutter/material.dart';
import 'package:monkey/pages/stats.dart';

import 'add_new_item_list.dart';
import 'budget_screen.dart';
import 'items_getter.dart';

class Shoping extends StatefulWidget {
  const Shoping({Key? key}) : super(key: key);

  @override
  State<Shoping> createState() => _ShopingState();
}

class _ShopingState extends State<Shoping> {
  @override
  Widget build(BuildContext context) {
    const numItems = 20;
    const _biggerFont = TextStyle(fontSize: 18.0);

    Widget _buildRow(int idx) {
      return ListTile(
        leading: CircleAvatar(
          child: Text('$idx'),
        ),
        title: Text(
          'Item $idx',
          style: _biggerFont,
        ),
        trailing: const Icon(Icons.dashboard),
      );
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          foregroundColor: Colors.grey[600],
          title: Text('Shoping list'),
          centerTitle: true,
        ),
        body: ItemsGetter(),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: (() async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddNewItemList()),
              );
              setState(() {
                
              });
            }),
            label: const Text('Add item')));
  }
}
