import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

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
    return "$balance kn";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(children: <Widget>[
            Container(
              alignment: AlignmentDirectional.center,
                color: Colors.white,
              child: Text(
                'Balance',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 45),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Text(
                getBalance(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 45),
              ),
            ),
          ]),
          _buildDraggableScrollableSheet(),
        ],
      ),
    );
  }

  DraggableScrollableSheet _buildDraggableScrollableSheet() {


    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.8,
      maxChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          child: Scrollbar(
            child: Test()
            ),
          );
      },
    );
  }
}
