import "package:flutter/material.dart";
import "package:flutter/scheduler.dart";

const ThemeMode themeMode = ThemeMode.system;
final bool isDarkMode =
    SchedulerBinding.instance.platformDispatcher.platformBrightness ==
        Brightness.dark;
final appTheme = ThemeData(useMaterial3: true, colorSchemeSeed: Colors.orange);
