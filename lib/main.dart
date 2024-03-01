import 'package:accessibility_tools/accessibility_tools.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'demos.dart';
import 'router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Accessibility Samples',
      showSemanticsDebugger: false,
      /// Note: on Flutter 3.19.0 showSemanticsDebugger is not working properly
      /// without wrapping the widgets with the AccessibilityTools widget.
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      // Uncomment the following line to enable app-wide accessibility tools
      builder: (context, child) => AccessibilityTools(child: child),
      routerConfig: router,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accessibility Samples'),
      ),
      body: ListView(
        children: [
          ...demos.map((d) => DemoTile(demo: d)),
        ],
      ),
    );
  }
}

class DemoTile extends StatelessWidget {
  final Demo demo;

  const DemoTile({
    super.key,
    required this.demo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo.name),
      onTap: () => context.go('/${demo.route}'),
    );
  }
}
