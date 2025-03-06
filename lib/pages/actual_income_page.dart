import 'package:flutter/material.dart';
import 'package:home_finance_management/components/delete_income.dart';
import 'package:home_finance_management/components/edit_income.dart';
import 'package:home_finance_management/components/save_income.dart';
import 'package:intl/intl.dart';
import '../components/drawer_sample.dart';
import '../components/filter_incomes.dart';
import '../components/text_field_sample.dart';
import '../model/filter.dart';
import '../model/list_actual_income.dart';

class ActualIncomePage extends StatefulWidget {
  const ActualIncomePage({super.key});

  @override
  State<ActualIncomePage> createState() => _ActualIncomePage();
}

class _ActualIncomePage extends State<ActualIncomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _incomeController = TextEditingController();
  DateTime? _selectedDate;

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
                controller: _incomeController,
                keyboardType: TextInputType.number),
            ElevatedButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2024),
                  lastDate: DateTime.now(), // Ограничение до сегодняшней даты
                );
                if (picked != null && picked != _selectedDate) {
                  setState(() {
                    _selectedDate = picked;
                  });
                }
              },
              child: const Text('Выбрать дату'),
            ),
            ElevatedButton(
              onPressed: () {
                saveIncome(_selectedDate, _incomeController, context);
                setState(() {}); // Обновление состояния после сохранения
              },
              child: const Text('Сохранить'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredIncomes.length,
                itemBuilder: (context, index) {
                  final income = filteredIncomes[index];
                  return ListTile(
                    title: Text('${income.sum} рублей'),
                    subtitle: Text(DateFormat('d.M.y').format(income.date)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            editIncome(index, context, updateState);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            deleteIncome(index, updateState);
                            setState(
                                    () {}); // Обновление состояния после удаления
                          },
                        ),
                      ],
                    ),
                  );
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
