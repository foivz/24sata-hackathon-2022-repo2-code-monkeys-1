import 'package:flutter/material.dart';
import 'package:monkey/pages/create_budget_screen.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _kTabPages.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final _kTabPages = <Widget>[
    const Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
    const Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
  ];
  final _kTabs = <Tab>[
    const Tab(text: 'Budget'),
    const Tab(text: 'Goals'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          foregroundColor: Colors.grey[600],
          bottom: TabBar(
            labelColor: Colors.grey[600],
            tabs: _kTabs,
            controller: _tabController,
          ),
        ),
        body: TabBarView(controller: _tabController, children: _kTabPages),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: (() {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const CreateBudgetScreen(),
                ),
              );
            }),
            label: const Text('Add Budget')));
  }
}
