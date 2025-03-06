import 'package:flutter/material.dart';
import '../pages/actual_expenses_page.dart';
import '../pages/actual_income_page.dart';
import '../pages/history_page.dart';
import '../pages/planned_expenses_page.dart';
import '../pages/planned_income_page.dart';
import '../pages/statistics_page.dart';

class DrawerSample extends StatelessWidget {
  final bool actualIncomePage;
  final bool actualExpensesPage;
  final bool plannedIncomePage;
  final bool plannedExpensesPage;
  final bool statisticsPage;
  final bool historyPage;

  const DrawerSample(
      {super.key,
      required this.actualIncomePage,
      required this.actualExpensesPage,
      required this.plannedIncomePage,
      required this.plannedExpensesPage,
      required this.statisticsPage,
      required this.historyPage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.trending_up),
            title: const Text('Фактические доходы'),
            onTap: () {
              if (actualIncomePage == true) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ActualIncomePage(),
                  ),
                );
              } else {
                Navigator.pop(context);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.trending_down),
            title: const Text('Фактические расходы'),
            onTap: () {
              if (actualExpensesPage == true) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ActualExpensesPage(),
                  ),
                );
              } else {
                Navigator.pop(context);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.schedule),
            title: const Text('Запланированные доходы'),
            onTap: () {
              if (plannedIncomePage == true) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlannedIncomePage(),
                  ),
                );
              } else {
                Navigator.pop(context);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.schedule),
            title: const Text('Запланированные расходы'),
            onTap: () {
              if (plannedExpensesPage == true) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlannedExpensesPage(),
                  ),
                );
              } else {
                Navigator.pop(context);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.bar_chart),
            title: const Text('Статистика'),
            onTap: () {
              if (statisticsPage == true) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StatisticsPage(),
                  ),
                );
              } else {
                Navigator.pop(context);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('История'),
            onTap: () {
              if (historyPage == true) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HistoryPage(),
                  ),
                );
              } else {
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
