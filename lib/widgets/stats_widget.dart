import 'package:flutter/material.dart';

class StatsPageSelector extends StatelessWidget {
  const StatsPageSelector({Key? key}) : super(key: key);

  static const kIcons = <Widget>[
    Icon(Icons.pie_chart),
    Icon(Icons.pie_chart_outline),
    Icon(Icons.pie_chart_outline_rounded),
    Icon(Icons.pie_chart_sharp),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: kIcons.length,
      // Use a Builder here, otherwise `DefaultTabController.of(context)` below
      // returns null.
      child: Builder(
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              const TabPageSelector(),
              Expanded(
                child: IconTheme(
                  data: IconThemeData(
                    size: 128.0,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: const TabBarView(children: kIcons),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
