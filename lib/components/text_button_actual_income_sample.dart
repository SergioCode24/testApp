import 'package:flutter/material.dart';
import 'package:home_finance_management/components/show_error_dialog.dart';
import '../model/list_actual_income.dart';

class TextButtonActualIncomeSample extends StatefulWidget {
  final TextEditingController sumController;
  final DateTime? selectedDate;
  final int index;
  final Income income;
  final VoidCallback onSave;

  const TextButtonActualIncomeSample(
      {super.key,
      required this.sumController,
      required this.selectedDate,
      required this.index,
      required this.income,
      required this.onSave});

  @override
  State<TextButtonActualIncomeSample> createState() =>
      _TextButtonActualIncomeSample(
          selectedDate, sumController, index, income, onSave);
}

class _TextButtonActualIncomeSample
    extends State<TextButtonActualIncomeSample> {
  final TextEditingController sumController;
  final DateTime? selectedDate;
  final int index;
  final Income income;
  final VoidCallback onSave;

  _TextButtonActualIncomeSample(this.selectedDate, this.sumController,
      this.index, this.income, this.onSave);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        double sum;
        try {
          sum = double.parse(sumController.text);
        } catch (e) {
          showErrorDialog(context, 'Ошибка ввода',
              'Пожалуйста, введите корректное числовое значение.');
          return;
        }

        if (sumController.text.isNotEmpty && selectedDate != null) {
          setState(() {
            actualIncomes[index] =
                Income(id: income.id, date: selectedDate!, sum: sum);

            // Сортировка списка по дате
            actualIncomes.sort((a, b) => a.date.compareTo(b.date));

            // Обновление фильтрованного списка
            onSave();
          });
        }
        Navigator.of(context).pop();
      },
      child: const Text('Сохранить'),
    );
  }
}
