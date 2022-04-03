import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monkey/pages/signup_options.dart';
import 'package:monkey/models/transaction_card.dart';
import 'package:monkey/pages/transaction_geter.dart';


class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);
  static List<TransactionCard> listTile = [
    TransactionCard("fds", Decimal.fromInt(800), "income", "cat"),
    TransactionCard("fds", Decimal.fromInt(-20), "e", "cat"),
    TransactionCard("fds", Decimal.fromInt(-50), "edgfdgfd", "cat")
  ];
  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  ListTile tileBuilder(int index, List<TransactionCard> listTile) {
    return ListTile(
        title: Text(listTile.elementAt(index).note),
        trailing: Text(listTile.elementAt(index).value.toString()),
        leading: getTypeOfTransaction(index, listTile),
        onTap: () => setState(() {
              for (TransactionCard card in listTile) {
                Decimal temp = card.value;
                card.value = temp;
              }
              TransactionScreen();
            }));
  }

  Icon getTypeOfTransaction(index, List<TransactionCard> listTile) {
    if (listTile.elementAt(index).value.compareTo(Decimal.zero) == -1) {
      return Icon(Icons.minimize);
    } else {
      return Icon(Icons.add);
    }
  }

  String getBalance() {

    Decimal balance = Decimal.zero;
    /*for (TransactionCard t in widget.listT) {
      balance = balance + t.value;
    }*/
    return "${user.balance} kn";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget> [
          Container(
            width: 700,
            padding: EdgeInsets.fromLTRB(36, 8, 36, 36),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/images/peaks.png"),
                fit: BoxFit.fill
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8)

              )
            ),
            child: Column(

              children: <Widget> [
                Text("👋 ${user.name}, welcome!",
                  style: TextStyle(
                    color: Colors.white70
                  ),
                ),

                SizedBox(height: 16),
                const Text("Balance",
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 8),
                Text(getBalance(),
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                )
              ],
            )
          ),
          Expanded(child: Test(),
          )
        ],
      ),
    );
  }

}
