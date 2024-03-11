import 'package:flutter/material.dart';

import '../models/transaction.dart';

class LargeListDemo extends StatelessWidget {
  const LargeListDemo({super.key});

  static const String routeName = 'large_list';
  static const String title = 'Large list traversal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: Column(
        children: [
          const Text(
            'List traversal using ListView.builder()',
            textAlign: TextAlign.center,
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: testLargeTransactionsData.length,
              prototypeItem: _TransactionItem(
                transaction: testLargeTransactionsData.first,
              ),
              itemBuilder: (context, index) {
                return _TransactionItem(
                  transaction: testLargeTransactionsData[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const _TransactionItem({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    final amount = transaction.amount;
    final date = transaction.date;
    return Semantics(
      label: 'Transaction of $amount on $date',
      child: ExcludeSemantics(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            color: Colors.grey.withOpacity(0.1),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ListTile(
              leading: const CircleAvatar(backgroundColor: Colors.blue),
              title: Text(transaction.description),
              subtitle: Text(date),
              trailing: Text(amount.toString()),
            ),
          ),
        ),
      ),
    );
  }
}
