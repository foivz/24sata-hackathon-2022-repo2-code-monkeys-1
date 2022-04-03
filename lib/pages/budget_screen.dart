import 'package:flutter/material.dart';
import 'package:monkey/pages/create_budget_screen.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          foregroundColor: Colors.grey[600],
          title: Text('Budget'),
          centerTitle: true,
        ),
        body: Column(),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: (() {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const CreateBudgetScreen(),
                ),
              );
            }),
            label: const Text('Add Budget')));
  }
}
