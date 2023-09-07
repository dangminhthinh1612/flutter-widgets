import "dart:io";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_application_1/common/theme.dart";
import "package:flutter_application_1/screens/new_transaction.dart";
import "package:flutter_application_1/widgets/Drawer/drawer_column.dart";
import "package:window_size/window_size.dart";

void main() {
  // setupWindows();
  runApp(const App());
}

const double windowWidth = 400;
const double windowHeight = 800;

void setupWindows() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle("Provider Demo");
    setWindowMinSize(const Size(windowWidth, windowHeight));
    setWindowMaxSize(const Size(windowWidth, windowHeight));
    getCurrentScreen().then((screen) {
      setWindowFrame(
        Rect.fromCenter(
          center: screen!.frame.center,
          width: windowWidth,
          height: windowHeight,
        ),
      );
    });
  }
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
