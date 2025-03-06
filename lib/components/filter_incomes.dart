import '../model/filter.dart';
import '../model/list_actual_income.dart';

void filterIncomes(Function updateState) {
  filteredIncomes = actualIncomes.where((income) {
    return (income.date.isAfter(filterDates[0].startDate) ||
        income.date.isAtSameMomentAs(filterDates[0].startDate)) &&
        (income.date.isBefore(filterDates[0].endDate) ||
        income.date.isAtSameMomentAs(filterDates[0].endDate));
  }).toList();

  updateState(); // Обновление состояния
}