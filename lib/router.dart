import 'package:go_router/go_router.dart';

import 'demos.dart';
import 'main.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: _demoRoutes,
    ),
  ],
);

final _demoRoutes = demos
    .map(
      (demo) => GoRoute(
        path: demo.route,
        builder: (context, state) => demo.builder(context),
      ),
    )
    .toList();
