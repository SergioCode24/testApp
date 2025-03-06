import 'package:flutter/material.dart';
import '../components/drawer_sample.dart';

class ActualExpensesPage extends StatefulWidget {
  const ActualExpensesPage({super.key});

  @override
  State<ActualExpensesPage> createState() => _ActualExpensesPage();
}

class _ActualExpensesPage extends State<ActualExpensesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Фактические расходы",
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
          actualExpensesPage: false,
          plannedIncomePage: true,
          plannedExpensesPage: true,
          statisticsPage: true,
          historyPage: true),
    );
  }

  void update() {
    setState(() {});
  }
}
