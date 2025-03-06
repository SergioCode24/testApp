import 'package:flutter/material.dart';
import 'package:home_finance_management/components/text_button_actual_income_sample.dart';
import 'package:home_finance_management/components/text_field_sample.dart';
import 'package:home_finance_management/model/list_actual_income.dart';
import '../model/edit_incomes.dart';
import 'filter_incomes.dart';

void editIncome(int index, BuildContext context, VoidCallback onUpdate) {
  editIncomes[0].sum.text = filteredIncomes[index].sum.toString();
  editIncomes[0].selectedDate = filteredIncomes[index].date;
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Редактировать доход'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldSample(
                controller: editIncomes[0].sum,
                labelText: 'Введите доход',
                keyboardType: TextInputType.number),
            ElevatedButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: filteredIncomes[index].date,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(), // Ограничение до сегодняшней даты
                );
                if (picked != null) {
                  editIncomes[0].selectedDate = picked;
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
            index: index,
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
