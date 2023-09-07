import "package:flutter/material.dart";

class DrawerColumn extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<ThemeMode> onSwitch;

  const DrawerColumn({
    super.key,
    required this.isDarkMode,
    required this.onSwitch,
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
          child: Text("Header"),
        ),
        Expanded(
          child: Column(
            children: [
              ListTile(
                title: const Text("Title 1"),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Title 2"),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Title 3"),
                onTap: () {},
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Ver: 1.0.0"),
            Switch(
              value: widget.isDarkMode,
              thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
                  (Set<MaterialState> states) {
                if (widget.isDarkMode) {
                  return const Icon(Icons.dark_mode_rounded);
                } else {
                  return const Icon(Icons.light_mode_rounded);
                }
              }),
              inactiveThumbColor: Colors.teal,
              inactiveTrackColor: Colors.white,
              onChanged: (bool value) {
                if (value) {
                  widget.onSwitch(ThemeMode.dark);
                } else {
                  widget.onSwitch(ThemeMode.light);
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
