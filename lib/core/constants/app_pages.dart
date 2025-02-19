import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lady_first_flutter/features/auth/login_screen.dart';
import 'package:lady_first_flutter/features/auth/register_screen.dart';
import 'package:lady_first_flutter/features/cart/cart_screen.dart';
import 'package:lady_first_flutter/features/checkout/checkout_screen.dart';
import 'package:lady_first_flutter/features/checkout/order_place_screen.dart';
import 'package:lady_first_flutter/features/favorite/favorite_screen.dart';
import 'package:lady_first_flutter/features/home/presentation/views/home_screen.dart';
import 'package:lady_first_flutter/features/notification/notification_screen.dart';
import 'package:lady_first_flutter/features/product/presentation/views/product_detail/product_detail_screen.dart';
import 'package:lady_first_flutter/features/search/search_screen.dart';

import '../../features/user/profile_screen.dart';
import '../../layout.dart';
import '../dimension/screen_dimension.dart';
import 'routes.dart';

// Add this custom transition builder
class FadeForwardTransitionPage<T> extends CustomTransitionPage<T> {
  FadeForwardTransitionPage({
    required LocalKey key,
    required Widget child,
  }) : super(
          key: key,
          child: child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve),
            );
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        );
}

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
        path: "/${Routes.productDetail}/:productId",
        pageBuilder: (context, state) {
          final String productId = state.pathParameters['productId']!;
          return FadeForwardTransitionPage(
            key: state.pageKey,
            child: ProductDetailScreen(productId: int.parse(productId)),
          );
        },
      ),
      GoRoute(
        name: Routes.notification,
        path: "/${Routes.notification}",
        pageBuilder: (context, state) => FadeForwardTransitionPage(
          key: state.pageKey,
          child: const NotificationScreen(),
        ),
      ),
      GoRoute(
        name: Routes.cart,
        path: "/${Routes.cart}",
        pageBuilder: (context, state) => FadeForwardTransitionPage(
          key: state.pageKey,
          child: const CartScreen(),
        ),
      ),
      GoRoute(
          name: Routes.checkout,
          path: "/${Routes.checkout}",
          pageBuilder: (context, state) => FadeForwardTransitionPage(
                key: state.pageKey,
                child: const CheckoutScreen(),
              ),
          routes: [
            GoRoute(
              name: Routes.orderPlaced,
              path: Routes.orderPlaced,
              pageBuilder: (context, state) => FadeForwardTransitionPage(
                key: state.pageKey,
                child: const OrderPlaceScreen(),
              ),
            )
          ]),
      GoRoute(
        name: Routes.login,
        path: "/${Routes.login}",
        pageBuilder: (context, state) => FadeForwardTransitionPage(
          key: state.pageKey,
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        name: Routes.register,
        path: "/${Routes.register}",
        pageBuilder: (context, state) => FadeForwardTransitionPage(
          key: state.pageKey,
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(
        name: Routes.favorite,
        path: "/${Routes.favorite}",
        pageBuilder: (context, state) => FadeForwardTransitionPage(
          key: state.pageKey,
          child: const FavoriteScreen(),
        ),
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
                pageBuilder: (context, state) => FadeForwardTransitionPage(
                  key: state.pageKey,
                  child: const HomeScreen(),
                ),
              ),
              GoRoute(
                name: Routes.search,
                path: "/${Routes.search}",
                pageBuilder: (context, state) => FadeForwardTransitionPage(
                  key: state.pageKey,
                  child: const SearchScreen(),
                ),
              ),
            ],
          ),

          // Branch 1
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                name: Routes.profile,
                path: "/${Routes.profile}",
                pageBuilder: (context, state) => FadeForwardTransitionPage(
                  key: state.pageKey,
                  child: const ProfileScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
