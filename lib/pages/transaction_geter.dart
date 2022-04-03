import 'package:flutter/material.dart';
import 'package:monkey/database/database.dart';
import 'package:monkey/pages/signup_options.dart';
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
          future: DatabaseService().getData("transactions"),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Smth wrong');
            }
            if (snapshot.connectionState == ConnectionState.done) {
              dataList = snapshot.data as List;
              user.balance = 0;
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
    user.balance += dataList[index]['value']/100;
    return ListTile(
      leading: dataList[index]['value'] < 0 ? const Icon(Icons.minimize, color: Color(0xFFAF3B6E)) : const Icon(Icons.add, color: Color(0xFF009F6B),),
      title: Text(
        dataList[index]['note'],
      ),
      subtitle: Text("${dataList[index]['value']/100} kn",
          style: TextStyle(
            color: dataList[index]['value'] < 0 ? Color(0xFFAF3B6E) : Color(0xFF009F6B)
          ),
      ),
    );
  },
);