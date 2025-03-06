import 'package:flutter/cupertino.dart';

class Edit {
  DateTime? selectedDate;
  TextEditingController sum;

  Edit({required this.selectedDate, required this.sum});
}

List<Edit> editIncomes = [
  Edit(selectedDate: null, sum: TextEditingController())
];
