import 'package:flutter/material.dart';
import '../model/date_of_income.dart';

class SelectDateOfIncome extends StatefulWidget {
  const SelectDateOfIncome({super.key});

  @override
  State<SelectDateOfIncome> createState() => _SelectDateOfIncomeState();
}

class _SelectDateOfIncomeState extends State<SelectDateOfIncome> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2024),
          lastDate: DateTime.now(), // Ограничение до сегодняшней даты
        );
        if (picked != null && picked != selectedDate) {
          setState(() {
            selectedDate = picked;
          });
        }
      },
      child: const Text('Выбрать дату'),
    );
  }
}
