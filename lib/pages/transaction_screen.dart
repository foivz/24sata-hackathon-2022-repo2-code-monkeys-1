import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';


class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

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
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50)
          )
          ),
          child: Scrollbar(
            child: ListView.builder(
             controller: scrollController,
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  //leading: const Icon(Icons.ac_unit),
                  //title: Text('Item $index'),
                );
              },
            ),
          ),
        );
      },
    );
  }
}