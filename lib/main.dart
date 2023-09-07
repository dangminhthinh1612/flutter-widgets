import "package:flutter/material.dart";
import "package:flutter_application_1/common/theme.dart";
import "package:flutter_application_1/screens/new_transaction.dart";
import "package:flutter_application_1/widgets/Drawer/drawer_column.dart";

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
  ThemeMode _themeMode = themeMode;
  bool _isDarkMode = isDarkMode;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Widgets"),
        ),
        drawer: Drawer(
          child: DrawerColumn(
            isDarkMode: _isDarkMode,
            onSwitch: (ThemeMode value) {
              setState(() {
                _isDarkMode = !_isDarkMode;
                _themeMode = value;
              });
            },
          ),
        ),
        body: const Center(
          child: NewTransaction(),
        ),
      ),
    );
  }
}
