import 'package:flutter/material.dart';
import 'package:home_finance_management/components/button_filter_date.dart';
import 'package:home_finance_management/components/button_reset_filter.dart';

class FilterButtons extends StatefulWidget {
  final VoidCallback onSave;

  const FilterButtons({super.key, required this.onSave});

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8.0, // Расстояние между элементами по горизонтали
      children: [
        ButtonFilterDate(
            updateState: widget.onSave,
            startDate: true,
            endDate: false,
            text: 'начальную'),
        ButtonFilterDate(
            updateState: widget.onSave,
            startDate: false,
            endDate: true,
            text: 'конечную'),
        ButtonResetFilter(updateState: widget.onSave),
      ],
    );
  }
}
