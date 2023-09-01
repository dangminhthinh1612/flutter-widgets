import 'package:flutter/material.dart';

class DrawerColumn extends StatelessWidget {
  const DrawerColumn({super.key});

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
                title: const Text('Title 1'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Title 2'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Title 3'),
                onTap: () {},
              )
            ],
          ),
        ),
        const ListTile(title: Text("Ver: 1.0.0"))
      ],
    );
  }
}
