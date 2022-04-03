import 'package:flutter/material.dart';
import 'package:monkey/database/database.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  List dataList = [];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: DatabaseService().getData('budgets'),
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
            dataList[index]['amount'].toString(),
          ),
          subtitle: Text(
            dataList[index]['name'],
          ),
        );
      },
    );