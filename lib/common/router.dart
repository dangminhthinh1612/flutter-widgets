import "package:flutter_application_1/screens/main_app.dart";
import "package:flutter_application_1/screens/new_transaction.dart";
import "package:flutter_application_1/screens/provider_shop/cart.dart";
import "package:flutter_application_1/screens/provider_shop/catalog.dart";
import "package:go_router/go_router.dart";

GoRouter routers() {
  return GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(path: "/", builder: (context, state) => const MainAppScreen()),
      // GoRoute(path: "/", builder: (context, state) => const Home()),
      GoRoute(
        path: "/catalog",
        builder: (context, state) => const MyCatalog(),
        routes: [
          GoRoute(path: "cart", builder: (context, state) => const MyCart()),
        ],
      ),
      GoRoute(
        path: "/transaction",
        builder: (context, state) => const Transaction(),
      ),
    ],
  );
}
