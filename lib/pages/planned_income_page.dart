import 'package:flutter/material.dart';
import '../components/drawer_sample.dart';

class PlannedIncomePage extends StatefulWidget {
  const PlannedIncomePage({super.key});

  @override
  State<PlannedIncomePage> createState() => _PlannedIncomePage();
}

class _PlannedIncomePage extends State<PlannedIncomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Запланированные доходы",
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
          plannedIncomePage: false,
          plannedExpensesPage: true,
          statisticsPage: true,
          historyPage: true),
    );
  }

  void update() {
    setState(() {});
  }
}
