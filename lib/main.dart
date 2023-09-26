import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/router.dart';
import 'package:flutter_application_1/common/theme.dart';
import 'package:flutter_application_1/providers/category_provider.dart';
import 'package:flutter_application_1/models/provider_shop/cart.dart';
import 'package:flutter_application_1/models/provider_shop/catalog.dart';
import 'package:flutter_application_1/providers/note/note_notifier.dart';
import 'package:flutter_application_1/providers/transaction_provider.dart';
import 'package:provider/provider.dart';

void main() {
  // setupWindows();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => Catalog()),
        ChangeNotifierProxyProvider<Catalog, Cart>(
          create: (context) => Cart(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('Cart');

            cart.catalog = catalog;
            return cart;
          },
        ),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
        ChangeNotifierProvider(create: (context) => NoteNotifier()),
      ],
      child: MaterialApp.router(
        theme: appTheme,
        // darkTheme: ThemeData.dark(),
        // themeMode: themeMode,
        debugShowCheckedModeBanner: false,
        routerConfig: routers(),
      ),
    );
  }
}
