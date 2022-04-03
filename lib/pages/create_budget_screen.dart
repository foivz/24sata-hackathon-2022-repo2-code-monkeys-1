import 'package:flutter/material.dart';

class CreateBudgetScreen extends StatefulWidget {
  const CreateBudgetScreen({Key? key}) : super(key: key);

  @override
  State<CreateBudgetScreen> createState() => _CreateBudgetScreenState();
}

class _CreateBudgetScreenState extends State<CreateBudgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          foregroundColor: Colors.grey[600],
          title: Text('New budget'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.check))
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(36),
          child: Column(children: [
            const TextField(
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
            )),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            const TextField(
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Category',
            )),
            const SizedBox(height: 16),
            FlatButton(
              minWidth: 250,
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {},
                child: Text('Add'))
          ]),
        ));
  }
}
