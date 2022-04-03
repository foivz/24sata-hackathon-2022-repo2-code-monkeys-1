import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:monkey/pages/shopping.dart';
import 'package:monkey/pages/stats.dart';
import 'package:monkey/util/utility.dart';
import 'package:monkey/models/category.dart';

import 'budget_screen.dart';

class AddNewTransaction extends StatefulWidget {
  const AddNewTransaction({Key? key}) : super(key: key);

  @override
  State<AddNewTransaction> createState() => _AddNewTransactionState();
}

class _AddNewTransactionState extends State<AddNewTransaction> {
  String note = '';
  Decimal value = Decimal.zero;
  TextEditingController controllerNote = TextEditingController();
  TextEditingController controllerAmount = TextEditingController();
  void saveValues() {
    Utility.database.createTransaction(Decimal.parse(controllerAmount.text),
        controllerNote.text, Category('', ''));
    Navigator.pop(context);
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
                  FocusScope.of(context).unfocus();
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const Stats(),
                    ),
                  );
                },
                icon: const Icon(Icons.bar_chart_rounded)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Shopping()));
                },
                icon: const Icon(Icons.shopping_bag_outlined)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BudgetScreen()));
                },
                icon: const Icon(Icons.account_balance_wallet)),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                  child: TextField(
                    controller: controllerNote,
                    decoration:
                        InputDecoration(labelText: "Enter transaction note:"),
                  ),
                  color: Colors.grey.shade300,
                  padding: EdgeInsets.all(10)),
              const Divider(),
              Container(
                  child: TextField(
                    controller: controllerAmount,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Enter transaction amount:",
                        helperText: "Add '-' for expenses!",),
                  ),
                  color: Colors.grey.shade300,
                  padding: EdgeInsets.all(10)),
            ElevatedButton(onPressed: () {saveValues();}, child: Text("Save"))],
          ),
        ));
  }
}
