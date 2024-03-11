class Transaction {
  final String description;
  final String date;
  final double amount;

  const Transaction({
    required this.description,
    required this.date,
    required this.amount,
  });
}

final testTransactionsData = [
  const Transaction(
    amount: 800.0,
    description: 'Gift',
    date: '12/12/2020',
  ),
  const Transaction(
    amount: 200.0,
    description: 'Gym',
    date: '01/01/2021',
  ),
  const Transaction(
    amount: 100.0,
    description: 'Food',
    date: '01/02/2021',
  ),
];

final testLargeTransactionsData = [
  ...testTransactionsData,
  ...testTransactionsData,
  ...testTransactionsData,
  ...testTransactionsData,
  ...testTransactionsData,
];