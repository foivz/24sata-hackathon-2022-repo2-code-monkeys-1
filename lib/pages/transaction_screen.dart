import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:monkey/models/transaction_card.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  ListTile tileBuilder (int index, List<TransactionCard> listTile){
    return ListTile(
      title: Text(listTile.elementAt(index).note),
      trailing: Text(listTile.elementAt(index).value.toString()),
      leading: getTypeOfTransaction(index, listTile),
      onTap: () => setState(() {
        for(TransactionCard card in listTile){
          Decimal temp = card.value;
          card.value = temp;
        }
        TransactionScreen();
      })
    );
  }

  Icon getTypeOfTransaction(index, List<TransactionCard> listTile) {
    if (listTile.elementAt(index).value.compareTo(Decimal.zero) == -1) {
      return Icon(Icons.minimize);
    } else {
      return Icon(Icons.add);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Container(
              color: Colors.grey[200],
              child:Text('Balance', textAlign: TextAlign.center),
            ),
          ),
        Container(
          margin: const EdgeInsets.fromLTRB(36, 24, 36, 24),
          child: Column(
            children: [
              Row(
                children: [
                  GFButton(
                    onPressed: (){},
                    text: "Income",
                    shape: GFButtonShape.pills,
                  ),
                  Spacer(),
                  GFButton(
                    onPressed: (){},
                    text: "Expenses",
                    shape: GFButtonShape.pills,
                  )
                ],
              ),
            ],
          ),
        ),
        _buildDraggableScrollableSheet(),

        ],
      ),
    );
  }

  DraggableScrollableSheet _buildDraggableScrollableSheet() {
    List<TransactionCard> listTile = [
      TransactionCard("fds", Decimal.fromInt(700), "income", "cat"),
      TransactionCard("fds", Decimal.fromInt(-20), "e", "cat"),
      TransactionCard("fds", Decimal.fromInt(-50), "edgfdgfd", "cat")
    ];
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          child: Scrollbar(
            child: ListView.builder(
              controller: scrollController,
              itemCount: listTile.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return tileBuilder(index, listTile);
              },
            ),
          ),
        );
      },
    );
  }
}
