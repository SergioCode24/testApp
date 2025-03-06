import 'package:flutter/material.dart';
import 'package:home_finance_management/components/save_income.dart';

class SaveActualIncome extends StatefulWidget {
  final VoidCallback updateState;

  const SaveActualIncome({super.key, required this.updateState});

  @override
  State<SaveActualIncome> createState() => _SaveActualIncomeState(updateState);
}

class _SaveActualIncomeState extends State<SaveActualIncome> {
  late VoidCallback updateState;

  _SaveActualIncomeState(updateState);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        saveIncome(context);
        setState(() {
          updateState();
        }); // Обновление состояния после сохранения
      },
      child: const Text('Сохранить'),
    );
  }
}
