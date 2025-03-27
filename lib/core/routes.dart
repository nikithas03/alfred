import 'package:alfred/config/alfred_constants.dart';
import 'package:alfred/presentation/screens/base_point_screen.dart';
import 'package:alfred/presentation/screens/delivery_screen.dart';
import 'package:alfred/presentation/screens/loading_screen.dart';
import 'package:alfred/presentation/screens/mapping_screen.dart';
import 'package:alfred/presentation/screens/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../presentation/screens/check_list_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: AlfredConstants.routeSplashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AlfredConstants.routeLoadingScreen,
        builder: (context, state) => const LoadingScreen(),
      ),
      GoRoute(
        path: AlfredConstants.routeChecklistScreen,
        builder: (context, state) => const ChecklistScreen(),
      ),
      GoRoute(
        path: AlfredConstants.routeBasePointScreen,
        builder: (context, state) => const BasePointScreen(),
      ),
      GoRoute(
        path: AlfredConstants.routeMappingScreen,
        builder: (context, state) => const MappingScreen(),
      ),
      GoRoute(
        path: AlfredConstants.routeDeliveryScreen,
        builder: (context, state) => const DeliveryScreen(),
      ),
    ],
    initialLocation: AlfredConstants.routeSplashScreen,
  );
});