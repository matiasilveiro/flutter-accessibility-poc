import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DyslexiaDemo extends StatelessWidget {
  const DyslexiaDemo({super.key});

  static const String routeName = 'dyslexia';
  static const String title = 'Dyslexia';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Text('Widget with default font'),
            _BalanceAmount(
              amount: 500,
              useCustomFont: false,
            ),
            Divider(),
            Text('Widget with default font and letterSpacing = 1.5'),
            _BalanceAmount(
              amount: 500,
              useCustomFont: false,
              letterSpacing: 1.5,
            ),
            Divider(),
            Text('Widget with OpenSans font'),
            _BalanceAmount(
              amount: 500,
              useCustomFont: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _BalanceAmount extends StatelessWidget {
  final double amount;
  final bool useCustomFont;
  final double? letterSpacing;

  const _BalanceAmount({
    super.key,
    required this.amount,
    required this.useCustomFont,
    this.letterSpacing,
  });

  TextStyle getTextStyle({required double fontSize}) {
    if (useCustomFont) {
      return GoogleFonts.openSans(
        fontSize: fontSize,
        letterSpacing: letterSpacing,
      );
    } else {
      return TextStyle(
        fontSize: fontSize,
        letterSpacing: letterSpacing,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Text(
              'This month',
              style: getTextStyle(fontSize: 20),
            ),
            Text(
              amount.toString(),
              style: getTextStyle(fontSize: 48),
            ),
            Text(
              'The total balance this month is $amount',
              style: getTextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
