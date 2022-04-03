import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:monkey/util/utility.dart';

class CreateBudgetScreen extends StatefulWidget {
  const CreateBudgetScreen({Key? key}) : super(key: key);

  @override
  State<CreateBudgetScreen> createState() => _CreateBudgetScreenState();
}

class _CreateBudgetScreenState extends State<CreateBudgetScreen> {
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final categoryController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    amountController.dispose();
    categoryController.dispose();
    super.dispose();
  }

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
             TextField(
              controller: nameController,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
            )),
            const SizedBox(height: 16),
             TextField(
              controller: amountController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
             TextField(
               controller: categoryController,
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Category',
            )),
            const SizedBox(height: 16),
            ElevatedButton(
                //minWidth: 250,
                //color: Colors.blue,
                //textColor: Colors.white,
                onPressed: () {saveValues();},
                child: Text('Add'))
          ]),
        ));
  }

  void saveValues(){
    Utility.database.createBudget(nameController.text,Decimal.parse(amountController.text), categoryController.text);
  }
}
