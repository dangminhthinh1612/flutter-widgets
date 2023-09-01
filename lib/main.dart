import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_application_1/widgets/Drawer/drawer_column.dart';
import 'package:flutter_application_1/widgets/caculator.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeMode _themeMode = ThemeMode.system;
  bool _isDarkMode =
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Widgets'),
          actions: [
            Switch(
              value: _isDarkMode,
              onChanged: (bool value) {
                setState(() {
                  _isDarkMode = !_isDarkMode;
                });

                if (_isDarkMode) {
                  changeTheme(ThemeMode.dark);
                } else {
                  changeTheme(ThemeMode.light);
                }
              },
            )
          ],
        ),
        drawer: const Drawer(child: DrawerColumn()),
        body: const Center(
          child: Caculator(),
        ),
      ),
    );
  }
}
