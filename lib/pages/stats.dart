import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/stats_widget.dart';

class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
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
                //Analytics
              },
              icon: const Icon(Icons.bar_chart_rounded, color: Colors.blue)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_bag_outlined)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.account_balance_wallet)),
        ],
      ),
      body: const StatsPageSelector()
    );
  }
}
