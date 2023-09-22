import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/foundation.dart';
import 'package:window_size/window_size.dart';

const ThemeMode themeMode = ThemeMode.system;
final bool isDarkMode =
    SchedulerBinding.instance.platformDispatcher.platformBrightness ==
        Brightness.dark;
final appTheme = ThemeData(useMaterial3: true, colorSchemeSeed: Colors.amber);

const double windowWidth = 400;
const double windowHeight = 800;

void setupWindows() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle('Provider Demo');
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
