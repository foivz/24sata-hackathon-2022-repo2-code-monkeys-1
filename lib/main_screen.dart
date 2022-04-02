import 'package:monkey/pages/analitics_screen.dart';
import 'package:monkey/widgets/screen_select.dart';
import 'package:flutter/material.dart';


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
            appBar: AppBar(
              backgroundColor: Colors.grey[200],
              leading: const Icon(Icons.attach_money_outlined),
              title: const Text("Budgettino"),
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
                    icon: Icon(Icons.bar_chart_rounded))
              ],
            ),
            body: const mainScreenBottomNav()),
        onWillPop: () async => false);
  }
}
