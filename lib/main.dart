import "package:flutter/material.dart";
import "package:flutter_application_1/common/router.dart";
import "package:flutter_application_1/common/theme.dart";

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
    return MaterialApp.router(
      theme: appTheme,
      // darkTheme: ThemeData.dark(),
      // themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      routerConfig: routers(),
    );
  }
}
