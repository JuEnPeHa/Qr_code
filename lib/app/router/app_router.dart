import 'package:go_router/go_router.dart';

import '../../features/generator/presentation/pages/generator_page.dart';
import '../../features/scanner/presentation/pages/scanner_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/scanner',
    routes: <RouteBase>[
      GoRoute(
        path: '/scanner',
        name: 'scanner',
        builder: (_, __) => const ScannerPage(),
      ),
      GoRoute(
        path: '/generator',
        name: 'generator',
        builder: (_, __) => const GeneratorPage(),
      ),
    ],
  );
}
