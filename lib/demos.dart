import 'package:accessibility_tools/accessibility_tools.dart';
import 'package:flutter/widgets.dart';

import 'screens/accessibility_tool_demo.dart';
import 'screens/dynamic_font_demo.dart';
import 'screens/dyslexia_demo.dart';
import 'screens/exclude_semantics_demo.dart';
import 'screens/large_grid_list_demo.dart';
import 'screens/large_list_demo.dart';
import 'screens/merge_semantics_demo.dart';
import 'screens/semantics_hierarchy_demo.dart';

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Demo({
    required this.name,
    required this.route,
    required this.builder,
  });
}

// -----------------------------------------------------------------------------

final demos = [
  Demo(
    name: ExcludeSemanticsDemo.title,
    route: ExcludeSemanticsDemo.routeName,
    builder: (ctx) => const ExcludeSemanticsDemo(),
  ),
  Demo(
    name: MergeSemanticsDemo.title,
    route: MergeSemanticsDemo.routeName,
    builder: (ctx) => const MergeSemanticsDemo(),
  ),
  Demo(
    name: SemanticsHierarchyDemo.title,
    route: SemanticsHierarchyDemo.routeName,
    builder: (ctx) => const SemanticsHierarchyDemo(),
  ),
  Demo(
    name: LargeListDemo.title,
    route: LargeListDemo.routeName,
    builder: (ctx) => const LargeListDemo(),
  ),
  Demo(
    name: LargeGridListDemo.title,
    route: LargeGridListDemo.routeName,
    builder: (ctx) => const LargeGridListDemo(),
  ),
  Demo(
    name: DynamicFontDemo.title,
    route: DynamicFontDemo.routeName,
    builder: (ctx) => const DynamicFontDemo(),
  ),
  Demo(
    name: DyslexiaDemo.title,
    route: DyslexiaDemo.routeName,
    builder: (ctx) => const DyslexiaDemo(),
  ),
  Demo(
    name: AccessibilityToolDemo.title,
    route: AccessibilityToolDemo.routeName,
    builder: (ctx) => const AccessibilityTools(child: AccessibilityToolDemo()),
  ),
];
