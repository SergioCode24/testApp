import 'package:flutter/material.dart';
import '../model/filter.dart';
import 'filter_incomes.dart';

class ButtonFilterDate extends StatefulWidget {
  final VoidCallback updateState;
  final bool startDate;
  final bool endDate;
  final String text;

  const ButtonFilterDate(
      {super.key,
      required this.updateState,
      required this.startDate,
      required this.endDate,
      required this.text});

  @override
  State<ButtonFilterDate> createState() =>
      _ButtonFilterDate(startDate, endDate, text);
}

class _ButtonFilterDate extends State<ButtonFilterDate> {
  final bool startDate;
  final bool endDate;
  final String text;

  _ButtonFilterDate(this.startDate, this.endDate, this.text);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        );
        if (picked != null) {
          setState(() {
            if (startDate == true) {
              filterDates[0].startDate = picked;
              filterIncomes(widget.updateState);
            }
            if (endDate == true) {
              filterDates[0].endDate = picked;
              filterIncomes(widget.updateState);
            }
          });
        }
      },
      child: Text('Выбрать $text дату', textAlign: TextAlign.center),
    );
  }
}
