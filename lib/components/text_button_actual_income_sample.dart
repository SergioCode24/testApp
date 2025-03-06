import 'package:flutter/material.dart';
import 'package:home_finance_management/components/show_error_dialog.dart';
import 'package:home_finance_management/model/edit_incomes.dart';
import '../model/list_actual_income.dart';

class TextButtonActualIncomeSample extends StatefulWidget {
  final int index;
  final VoidCallback onSave;

  const TextButtonActualIncomeSample(
      {super.key, required this.index, required this.onSave});

  @override
  State<TextButtonActualIncomeSample> createState() =>
      _TextButtonActualIncomeSample(index, onSave);
}

class _TextButtonActualIncomeSample
    extends State<TextButtonActualIncomeSample> {
  final int index;
  final VoidCallback onSave;

  _TextButtonActualIncomeSample(this.index, this.onSave);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        double sum;
        try {
          sum = double.parse(editIncomes[0].sum.text);
        } catch (e) {
          showErrorDialog(context, 'Ошибка ввода',
              'Пожалуйста, введите корректное числовое значение.');
          return;
        }

        if (TextEditingController(text: editIncomes[0].sum.toString())
                .text
                .isNotEmpty &&
            editIncomes[0].selectedDate != null) {
          setState(() {
            actualIncomes[index] = Income(
                id: filteredIncomes[index].id,
                date: editIncomes[0].selectedDate!,
                sum: sum);

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
