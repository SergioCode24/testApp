import 'package:flutter/material.dart';
import 'package:home_finance_management/components/filter_buttons.dart';
import 'package:home_finance_management/components/list_tile_sample.dart';
import 'package:home_finance_management/components/save_actual_income.dart';
import 'package:home_finance_management/components/select_date_of_income.dart';
import '../components/drawer_sample.dart';
import '../components/text_field_sample.dart';
import '../model/controller.dart';
import '../model/list_actual_income.dart';

class ActualIncomePage extends StatefulWidget {
  const ActualIncomePage({super.key});

  @override
  State<ActualIncomePage> createState() => _ActualIncomePage();
}

class _ActualIncomePage extends State<ActualIncomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Фактические доходы",
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
          actualIncomePage: false,
          actualExpensesPage: true,
          plannedIncomePage: true,
          plannedExpensesPage: true,
          statisticsPage: true,
          historyPage: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFieldSample(
                labelText: 'Введите доход',
                controller: incomeController,
                keyboardType: TextInputType.number),
            const SelectDateOfIncome(),
            SaveActualIncome(onSave: updateState),
            Expanded(
              child: ListView.builder(
                itemCount: filteredIncomes.length,
                itemBuilder: (context, index) {
                  return ListTileSample(index: index, onSave: updateState);
                },
              ),
            ),
            if (actualIncomes.isNotEmpty) FilterButtons(onSave: updateState),
          ],
        ),
      ),
    );
  }
}
