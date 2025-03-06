import 'package:flutter/material.dart';
import 'package:home_finance_management/components/save_income.dart';

class SaveActualIncome extends StatefulWidget {
  final VoidCallback onSave;

  const SaveActualIncome({super.key, required this.onSave});

  @override
  State<SaveActualIncome> createState() => _SaveActualIncomeState();
}

class _SaveActualIncomeState extends State<SaveActualIncome> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        saveIncome(context);
        widget.onSave(); // Вызов callback-функции для обновления состояния
      },
      child: const Text('Сохранить'),
    );
  }
}
