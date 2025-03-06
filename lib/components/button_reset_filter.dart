import 'package:flutter/material.dart';
import '../model/filter.dart';
import '../model/list_actual_income.dart';
import 'filter_incomes.dart';

class ButtonResetFilter extends StatefulWidget {
  final VoidCallback updateState;

  const ButtonResetFilter({super.key, required this.updateState});

  @override
  State<ButtonResetFilter> createState() => _ButtonResetFilterState();
}

class _ButtonResetFilterState extends State<ButtonResetFilter> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          filteredIncomes = actualIncomes;
          filterDates = [
            Filter(startDate: DateTime(2000, 1, 1), endDate: DateTime.now())
          ];
          filterIncomes(widget.updateState);
        });
      },
      child: const Text('Сбросить фильтр', textAlign: TextAlign.center),
    );
  }
}
