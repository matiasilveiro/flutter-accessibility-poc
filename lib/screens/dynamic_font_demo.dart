import 'package:flutter/material.dart';

class DynamicFontDemo extends StatelessWidget {
  const DynamicFontDemo({super.key});

  static const String routeName = 'dynamic_font';
  static const String title = 'Dynamic font';

  static const _loremIpsum =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit essecillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'This text scales automatically with dynamic font size',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(_loremIpsum),
            const Divider(),
            const Text(
              'This text scales automatically with dynamic font size',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const SizedBox(
              height: 180,
              child: Text(_loremIpsum),
            ),
            const Divider(),
            MediaQuery.withNoTextScaling(
              child: const Text(
                "This text doesn't take into account dynamic fonts",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            MediaQuery.withNoTextScaling(
              child: const Text(_loremIpsum),
            ),
          ],
        ),
      ),
    );
  }
}
