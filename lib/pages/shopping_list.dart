import 'package:flutter/material.dart';
import 'package:monkey/models/item_list.dart';
import '../util/utility.dart';
import 'add_new_item_list.dart';
import 'analitics_screen.dart';

const int numItems = 20;
const TextStyle _biggerFont = TextStyle(fontSize: 18.0);

class ShopingListScreen extends StatefulWidget {
  const ShopingListScreen({Key? key}) : super(key: key);

  @override
  State<ShopingListScreen> createState() => _ShopingListScreenState();
}

class _ShopingListScreenState extends State<ShopingListScreen> {
  List<ItemList> itemListList = List.empty(growable: true);
  void updateList(){
    setState(() {
      itemListList = Utility.itemListList;
    });
  }


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
                    MaterialPageRoute(builder: (context) => const Analise()),
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
        body: ListView.builder(
          itemCount: Utility.itemListList.length + 5,
          itemBuilder: (BuildContext context, int i) {
            if (i == 0) {
              return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddNewItemList())).then((value) => {
                        if(value!=null)
                          {
                            updateList()
                          }
                      });
                    },
                    leading: Icon(Icons.add),
                    title: Text('Add new shoping list', style: _biggerFont),
                  ));
            } else
              return _buildRow(i);
          },
        ));
  }
}
