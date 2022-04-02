import 'package:monkey/pages/analitics_screen.dart';
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Analise()),
                      );
                    }, 
                  icon: Icon(Icons.bar_chart_rounded)),
                IconButton(
                  onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined)),
                IconButton(
                  onPressed: () {}, icon: Icon(Icons.account_balance_wallet)),
              ],
            ),
            body: const mainScreenBottomNav()),
        onWillPop: () async => false);
  }
}
