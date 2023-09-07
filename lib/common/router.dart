import "package:flutter_application_1/screens/home.dart";
import "package:go_router/go_router.dart";

GoRouter routers() {
  return GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(path: "/", builder: (context, state) => const Home()),
    ],
  );
}
