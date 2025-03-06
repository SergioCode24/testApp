import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/list_actual_income.dart';
import 'delete_income.dart';
import 'edit_income.dart';

class ListTileSample extends StatefulWidget {
  final int index;
  final VoidCallback onSave;

  const ListTileSample({super.key, required this.index, required this.onSave});

  @override
  State<ListTileSample> createState() => _ListTileSampleState(index);
}

class _ListTileSampleState extends State<ListTileSample> {
  final int index;

  _ListTileSampleState(this.index);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${filteredIncomes[index].sum} рублей'),
      subtitle: Text(DateFormat('d.M.y').format(filteredIncomes[index].date)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              editIncome(index, context, widget.onSave);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              deleteIncome(index, widget.onSave);
              setState(() {}); // Обновление состояния после удаления
            },
          ),
        ],
      ),
    );
  }
}
