import 'package:flutter/material.dart';
import 'package:home_finance_management/components/list_tile_sample.dart';
import 'package:home_finance_management/components/save_actual_income.dart';
import 'package:home_finance_management/components/select_date_of_income.dart';
import '../components/drawer_sample.dart';
import '../components/filter_incomes.dart';
import '../components/text_field_sample.dart';
import '../model/controller.dart';
import '../model/filter.dart';
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
            SaveActualIncome(onSave: updateState), // Передача callback-функции
            Expanded(
              child: ListView.builder(
                itemCount: filteredIncomes.length,
                itemBuilder: (context, index) {
                  return ListTileSample(index: index, onSave: updateState);
                },
              ),
            ),
            if (actualIncomes.isNotEmpty)
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.0, // Расстояние между элементами по горизонтали
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate:
                            DateTime.now(), // Ограничение до сегодняшней даты
                      );
                      if (picked != null) {
                        setState(() {
                          filterDates[0].startDate = picked;
                          filterIncomes(updateState);
                        });
                      }
                    },
                    child: const Text('Выбрать начальную дату',
                        textAlign: TextAlign.center),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate:
                            DateTime.now(), // Ограничение до сегодняшней даты
                      );
                      if (picked != null) {
                        setState(() {
                          filterDates[0].endDate = picked;
                          filterIncomes(updateState);
                        });
                      }
                    },
                    child: const Text('Выбрать конечную дату',
                        textAlign: TextAlign.center),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        filteredIncomes = actualIncomes;
                        filterDates = [
                          Filter(
                              startDate: DateTime(2000, 1, 1),
                              endDate: DateTime.now())
                        ];
                      });
                    },
                    child: const Text('Сбросить фильтр',
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
