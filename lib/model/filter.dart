class Filter {
  DateTime startDate;
  DateTime endDate;

  Filter({required this.startDate, required this.endDate});
}

List<Filter> filterDates = [Filter(startDate: DateTime(2000, 1, 1), endDate: DateTime.now())];
