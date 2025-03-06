import 'package:flutter/cupertino.dart';
import 'package:home_finance_management/components/show_error_dialog.dart';
import '../model/controller.dart';
import '../model/date_of_income.dart';
import '../model/list_actual_income.dart';
import 'filter_incomes.dart';

void saveIncome(
    BuildContext context) {
  if (incomeController.text.isEmpty) {
    return;
  }
  double sum;
  try {
    sum = double.parse(incomeController.text);
  } catch (e) {
    showErrorDialog(context, 'Ошибка ввода',
        'Пожалуйста, введите корректное числовое значение.');
    return;
  }

  final id = actualIncomes.length;
  final income = Income(id: id, date: selectedDate, sum: sum);
  actualIncomes.add(income);
  incomeController.clear();

  // Сортировка списка по дате
  actualIncomes.sort((a, b) => a.date.compareTo(b.date));

  // Обновление фильтрованного списка
  filterIncomes(() {});
}
