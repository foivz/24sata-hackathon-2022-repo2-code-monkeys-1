import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tips extends StatelessWidget {
  const Tips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            color: Colors.white,
            padding: EdgeInsets.all(15),
            alignment: AlignmentDirectional.topCenter,
            child: Column(
              children: [
                Text("Three tips for buggeting begginers:\n",
                    style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold)),
                Text("1. Define your “why”!\n",
                    style: TextStyle(color: Colors.black, fontSize: 22)),
                Text(
                    "Whatever your motivation is, it’s very important to have a clear reason “why”. "
                    "Budgeting, especially as a beginner, requires a lot of conscious effort and repetition."
                    "After all, creating a new habit isn’t always fun.\n ",
                    style: TextStyle(color: Colors.black, fontSize: 20)),
                Text("2. Make sure your financial goals are realistic!\n",
                    style: TextStyle(color: Colors.black, fontSize: 22)),
                Text(
                    "Not only do you need to know why you want to start budgeting in the first place, but it’s also very important to think in terms of specific numbers."
                    "How much debt are you hoping to pay off each month? How much money do you want to put aside in your emergency fund? How much will you be saving to go toward your retirement?\n", style:TextStyle(color: Colors.black, fontSize: 20)),
                Text("3. Start with 50/30/20 method!\n",style: TextStyle(color: Colors.black, fontSize: 22)),
                Text(
                  "The 50/30/20 rule is an easy budgeting method that can help you to manage your money effectively, simply and sustainably. "
                  "The basic rule of thumb is to divide your monthly after-tax income into three spending categories: 50% for needs, 30% for wants and 20% for savings or paying off debt",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            )));
  }
}
