import 'package:flutter/material.dart';
import 'package:home_finance_management/components/text_button_actual_income_sample.dart';
import 'package:home_finance_management/components/text_field_sample.dart';
import '../model/list_actual_income.dart';
import 'filter_incomes.dart';

void editIncome(int index, BuildContext context, VoidCallback onUpdate) {
  final income = filteredIncomes[index];
  final TextEditingController sumController =
      TextEditingController(text: income.sum.toString());
  DateTime? selectedDate = income.date;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Редактировать доход'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldSample(
                controller: sumController,
                labelText: 'Введите доход',
                keyboardType: TextInputType.number),
            ElevatedButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(), // Ограничение до сегодняшней даты
                );
                if (picked != null) {
                  selectedDate = picked;
                }
              },
              child: const Text('Выбрать дату'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Отмена'),
          ),
          TextButtonActualIncomeSample(
            sumController: sumController,
            selectedDate: selectedDate,
            index: index,
            income: income,
            onSave: () {
              filterIncomes(onUpdate);
              onUpdate(); // Вызов callback-функции для обновления состояния
            },
          ),
        ],
      );
    },
  );
}
