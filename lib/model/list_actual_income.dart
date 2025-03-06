class Income {
  int id;
  DateTime date;
  double sum;

  Income({required this.id, required this.date, required this.sum});
}

List<Income> actualIncomes = [];

List<Income> filteredIncomes = [];
