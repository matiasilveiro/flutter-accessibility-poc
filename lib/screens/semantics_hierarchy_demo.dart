import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/semantics.dart';

import '../models/transaction.dart';

class SemanticsHierarchyDemo extends StatelessWidget {
  const SemanticsHierarchyDemo({super.key});

  static const String routeName = 'hierarchy_semantics';
  static const String title = 'Hierarchy Semantics';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: Column(
        children: [
          const Text(
            'To avoid cycling through all the list, use SortKeys',
            textAlign: TextAlign.center,
          ),
          Semantics(
            sortKey: const OrdinalSortKey(1),
            child: Column(
              children: testTransactionsData
                  .map(
                    (e) => _TransactionItem(transaction: e),
                  )
                  .toList(),
            ),
          ),
          const Spacer(),
          Semantics(
            sortKey: const OrdinalSortKey(0),
            child: FloatingActionButton(
              onPressed: _triggerTalkbackMessage,
              tooltip: 'Say a message out loud',
              child: const Icon(Icons.message),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  void _triggerTalkbackMessage() {
    SemanticsService.announce(
      'This is a triggered TalkBack message',
      TextDirection.ltr,
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
    return MergeSemantics(
      child: Padding(
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
      ),
    );
  }
}
