import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerColumn extends StatefulWidget {
  // final bool isDarkMode;
  // final ValueChanged<ThemeMode> onSwitch;

  const DrawerColumn({
    super.key,
    // required this.isDarkMode,
    // required this.onSwitch,
  });

  @override
  State<DrawerColumn> createState() => _DrawerColumnState();
}

class _DrawerColumnState extends State<DrawerColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DrawerHeader(
          child: Text('Header'),
        ),
        Expanded(
          child: Column(
            children: [
              ListTile(
                title: const Text('Home Screen'),
                onTap: () {
                  context.go('/');
                },
              ),
              ListTile(
                title: const Text('Provider Shop'),
                onTap: () {
                  context.go('/catalog');
                },
              ),
              ListTile(
                title: const Text('Note App'),
                onTap: () => context.go('/note'),
              ),
            ],
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Ver: 1.0.0'),
            // Switch(
            //   value: widget.isDarkMode,
            //   thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
            //       (Set<MaterialState> states) {
            //     if (widget.isDarkMode) {
            //       return const Icon(Icons.dark_mode_rounded);
            //     } else {
            //       return const Icon(
            //         Icons.light_mode_rounded,
            //         color: Colors.orange,
            //       );
            //     }
            //   }),
            //   inactiveThumbColor: Colors.white,
            //   inactiveTrackColor: Colors.lime,
            //   onChanged: (bool value) {
            //     if (value) {
            //       widget.onSwitch(ThemeMode.dark);
            //     } else {
            //       widget.onSwitch(ThemeMode.light);
            //     }
            //   },
            // ),
          ],
        ),
      ],
    );
  }
}
