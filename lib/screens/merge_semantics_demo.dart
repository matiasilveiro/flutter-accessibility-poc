import 'package:flutter/material.dart';

import '../models/transaction.dart';

class MergeSemanticsDemo extends StatelessWidget {
  const MergeSemanticsDemo({super.key});

  static const String routeName = 'merge_semantics';
  static const String title = 'Merge Semantics';

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
              'View these two widgets with TalkBack enabled',
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
              'Widget providing merged semantics',
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Row(
        children: [
          const CircleAvatar(backgroundColor: Colors.blue),
          const SizedBox(width: 10),
          Column(
            children: [
              Text(transaction.description),
              Text(transaction.date),
            ],
          ),
          const Spacer(),
          Text(transaction.amount.toString()),
        ],
      ),
    );
  }

  Widget getAccessibleItem(BuildContext context) {
    return MergeSemantics(
      child: getRegularItem(context),
    );
  }
}
