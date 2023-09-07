import "package:flutter_application_1/screens/home.dart";
import "package:flutter_application_1/screens/provider_shop/cart.dart";
import "package:flutter_application_1/screens/provider_shop/catalog.dart";
import "package:go_router/go_router.dart";

GoRouter routers() {
  return GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(path: "/", builder: (context, state) => const Home()),
      GoRoute(
        path: "/catalog",
        builder: (context, state) => const Catalog(),
        routes: [
          GoRoute(path: "cart", builder: (context, state) => const Cart()),
        ],
      ),
    ],
  );
}
