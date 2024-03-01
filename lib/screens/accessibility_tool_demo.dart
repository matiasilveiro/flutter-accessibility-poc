import 'package:flutter/material.dart';

class AccessibilityToolDemo extends StatelessWidget {
  const AccessibilityToolDemo({super.key});

  static const String routeName = 'accessibility_tool';
  static const String title = 'Accessibility Tool showcase';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: Column(
        children: <Widget>[
          const Text(
            'Tap area checker',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Center(
            child: Container(
              color: Colors.yellow,
              width: 10,
              height: 10,
              child: InkWell(
                onTap: () {},
                child: Container(),
              ),
            ),
          ),
          const Divider(),
          const Text(
            'Multiple criteria example',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 40,
            height: 40,
            child: InkWell(
              onTap: () {},
              child: const Icon(Icons.person),
            ),
          ),
          const Divider(),
          const Text(
            'Input field checker',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
            child: TextField(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter a search term',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: CheckboxRow(),
          ),
        ],
      ),
    );
  }
}

class CheckboxRow extends StatelessWidget {
  const CheckboxRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Row(
            children: [
              Checkbox(
                value: false,
                onChanged: null,
              ),
              Expanded(
                child: Text(
                  'This checkbox has no semantic label',
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Semantics(
                label: 'Show password',
                child: const Checkbox(
                  value: false,
                  onChanged: null,
                ),
              ),
              const Expanded(
                child: Text(
                  'This checkbox has a semantic label',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
