import 'package:flutter/material.dart';

import '../models/transaction.dart';

class ExcludeSemanticsDemo extends StatelessWidget {
  const ExcludeSemanticsDemo({Key? key}) : super(key: key);

  static const String routeName = 'exclude_semantics';
  static const String title = 'Exclude Semantics';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'View these two widgets with showSemanticsDebugger: true',
              textAlign: TextAlign.center,
            ),
            const Divider(),
            const Text(
              'Widget not taking semantics in consideration',
              textAlign: TextAlign.center,
            ),
            ...testTransactionsData.map(
              (e) => _TransactionItem(
                transaction: e,
                fancyAccessibility: false,
              ),
            ),
            const Divider(),
            const Text(
              'Widget providing custom semantics and excluding built-in semantics',
              textAlign: TextAlign.center,
            ),
            ...testTransactionsData.map(
              (e) => _TransactionItem(
                transaction: e,
                fancyAccessibility: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final bool fancyAccessibility;

  const _TransactionItem({
    super.key,
    required this.transaction,
    required this.fancyAccessibility,
  });

  @override
  Widget build(BuildContext context) {
    return fancyAccessibility
        ? getAccessibleItem(context)
        : getRegularItem(context);
  }

  Widget getRegularItem(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(backgroundColor: Colors.blue),
      title: Text(transaction.description),
      subtitle: Text(transaction.date),
      trailing: Text(transaction.amount.toString()),
    );
  }

  Widget getAccessibleItem(BuildContext context) {
    final amount = transaction.amount;
    final date = transaction.date;
    return Semantics(
      label: 'Transaction of $amount on $date',
      child: ExcludeSemantics(
        child: getRegularItem(context),
      ),
    );
  }
}
