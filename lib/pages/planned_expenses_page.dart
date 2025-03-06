import 'package:flutter/material.dart';
import '../components/drawer_sample.dart';

class PlannedExpensesPage extends StatefulWidget {
  const PlannedExpensesPage({super.key});

  @override
  State<PlannedExpensesPage> createState() => _PlannedExpensesPage();
}

class _PlannedExpensesPage extends State<PlannedExpensesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Запланированные расходы",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.grey,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: const DrawerSample(
          actualIncomePage: true,
          actualExpensesPage: true,
          plannedIncomePage: true,
          plannedExpensesPage: false,
          statisticsPage: true,
          historyPage: true),
    );
  }

  void update() {
    setState(() {});
  }
}
