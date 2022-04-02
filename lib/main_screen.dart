import 'package:monkey/database/database.dart';
import 'package:monkey/models/category.dart';
import 'package:monkey/pages/budget_screen.dart';
import 'package:monkey/widgets/action_button.dart';
import 'package:monkey/pages/stats.dart';
import 'package:monkey/widgets/screen_select.dart';
import 'package:flutter/material.dart';

import 'widgets/profile_drawer.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          drawer: const SeparatedDrawer(),
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
                    icon: Icon(Icons.bar_chart_rounded)),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined)),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BudgetScreen()));
                    },
                    icon: Icon(Icons.account_balance_wallet)),
              ],
            ),
            floatingActionButton: const ExampleExpandableFab()),
        onWillPop: () async => false);
  }
}
