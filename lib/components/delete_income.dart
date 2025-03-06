import '../model/list_actual_income.dart';
import 'filter_incomes.dart';

void deleteIncome(int index, Function updateState) {
  actualIncomes.removeAt(index);
  filterIncomes(updateState);
}
