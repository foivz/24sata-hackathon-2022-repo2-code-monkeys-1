import 'package:flutter/material.dart';
import 'package:monkey/database/database.dart';
import 'package:monkey/util/utility.dart';

class ItemsGetter extends StatefulWidget {
  const ItemsGetter({Key? key}) : super(key: key);

  @override
  State<ItemsGetter> createState() => _ItemsGetterState();
}

class _ItemsGetterState extends State<ItemsGetter> {
  List dataList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: DatabaseService().getData("items"),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Smth wrong');
            }
            if (snapshot.connectionState == ConnectionState.done) {
              dataList = snapshot.data as List;
              return buildItems(dataList);
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}

Widget buildItems(dataList) => ListView.separated(
  itemCount: dataList.length,
  separatorBuilder: (BuildContext context, int index) => const Divider(),
  itemBuilder: (BuildContext context, int index) {
    return ListTile(
      title: Text(
        dataList[index]['name'],
      ),
      subtitle: Text("Amount: ${dataList[index]['amount']}"),
      trailing: IconButton(icon: Icon(Icons.delete), onPressed: () {
        Utility.database.deleteItemById(dataList[index]['id']);
      },),
    );
  },
);