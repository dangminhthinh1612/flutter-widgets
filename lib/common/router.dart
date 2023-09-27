import 'package:flutter_application_1/screens/money_manager/main_app.dart';
import 'package:flutter_application_1/screens/money_manager/new_transaction.dart';
import 'package:flutter_application_1/screens/note/editor.dart';
import 'package:flutter_application_1/screens/note/home.dart';
import 'package:flutter_application_1/screens/provider_shop/cart.dart';
import 'package:flutter_application_1/screens/provider_shop/catalog.dart';
import 'package:flutter_application_1/screens/money_manager/settings/category.dart';
import 'package:go_router/go_router.dart';

GoRouter routers() {
  return GoRouter(
    initialLocation: '/note',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const MainAppScreen()),
      // GoRoute(path: "/", builder: (context, state) => const Home()),
      GoRoute(
        path: '/catalog',
        builder: (context, state) => const MyCatalog(),
        routes: [
          GoRoute(path: 'cart', builder: (context, state) => const MyCart()),
        ],
      ),
      GoRoute(
        path: '/settings/categories',
        builder: (context, state) => const CategoryScreen(),
      ),
      GoRoute(
        path: '/new_transaction',
        builder: (context, state) => const NewTransaction(),
      ),
      GoRoute(
        path: '/note',
        builder: (context, state) => const NoteHome(),
        routes: [
          GoRoute(
            path: 'new',
            builder: (context, state) => const NoteEditor(),
          ),
          GoRoute(
            path: 'edit/:id',
            name: 'noteDetail',
            builder: (context, state) {
              return NoteEditor(noteId: state.pathParameters['id']);
            },
          ),
        ],
      ),
    ],
  );
}
