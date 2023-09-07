import "package:flutter/material.dart";
import "package:flutter_application_1/widgets/Drawer/drawer_column.dart";
import "package:go_router/go_router.dart";

class Catalog extends StatelessWidget {
  const Catalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.go("/catalog/cart");
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: const Drawer(child: DrawerColumn()),
    );
  }
}
