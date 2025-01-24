import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lady_first_flutter/features/auth/login_screen.dart';
import 'package:lady_first_flutter/features/auth/register_screen.dart';
import 'package:lady_first_flutter/features/cart/cart_screen.dart';
import 'package:lady_first_flutter/features/checkout/checkout_screen.dart';
import 'package:lady_first_flutter/features/home/home_screen.dart';
import 'package:lady_first_flutter/features/notification/notification_screen.dart';
import 'package:lady_first_flutter/features/product/product_detail/product_detail_screen.dart';
import 'package:lady_first_flutter/features/search/search_screen.dart';

import '../../features/user/profile_screen.dart';
import '../../layout.dart';
import '../dimension/screen_dimension.dart';
import 'routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class AppPages {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: "/${Routes.home}",
    debugLogDiagnostics: false,
    routes: <RouteBase>[
      GoRoute(
        name: Routes.productDetail,
        path: "/${Routes.productDetail}",
        builder: (BuildContext context, GoRouterState state) =>
            const ProductDetailScreen(),
      ),
      GoRoute(
        name: Routes.notification,
        path: "/${Routes.notification}",
        builder: (BuildContext context, GoRouterState state) =>
            const NotificationScreen(),
      ),
      GoRoute(
        name: Routes.cart,
        path: "/${Routes.cart}",
        builder: (BuildContext context, GoRouterState state) =>
            const CartScreen(),
      ),
      GoRoute(
        name: Routes.checkout,
        path: "/${Routes.checkout}",
        builder: (BuildContext context, GoRouterState state) =>
            const CheckoutScreen(),
      ),
      GoRoute(
        name: Routes.login,
        path: "/${Routes.login}",
        builder: (BuildContext context, GoRouterState state) =>
            const LoginScreen(),
      ),
      GoRoute(
        name: Routes.register,
        path: "/${Routes.register}",
        builder: (BuildContext context, GoRouterState state) =>
            const RegisterScreen(),
      ),
      StatefulShellRoute(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return navigationShell;
        },
        navigatorContainerBuilder: (BuildContext context,
            StatefulNavigationShell navigationShell, List<Widget> children) {
          return Center(
            child: SizedBox(
                width: ScreenDimension.getWidth(context),
                child: Layout(
                    navigationShell: navigationShell, children: children)),
          );
        },
        branches: <StatefulShellBranch>[
          // Branch 0
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                name: Routes.home,
                path: "/${Routes.home}",
                builder: (BuildContext context, GoRouterState state) =>
                    const HomeScreen(),
              ),
              GoRoute(
                name: Routes.search,
                path: "/${Routes.search}",
                builder: (BuildContext context, GoRouterState state) =>
                    const SearchScreen(),
              ),
            ],
          ),

          // Branch 1
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                name: Routes.profile,
                path: "/${Routes.profile}",
                builder: (BuildContext context, GoRouterState state) =>
                    const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
