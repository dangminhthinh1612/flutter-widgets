import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/provider_shop/cart.dart';
import 'package:flutter_application_1/models/provider_shop/catalog.dart';
import 'package:flutter_application_1/models/provider_shop/item.dart';
import 'package:flutter_application_1/widgets/Drawer/drawer_column.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyCatalog extends StatelessWidget {
  const MyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.go('/catalog/cart');
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: const Drawer(child: DrawerColumn()),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _MyListItem(index),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({required this.item});

  @override
  Widget build(BuildContext context) {
    var isInCart =
        context.select<Cart, bool>((cart) => cart.items.contains(item));

    return TextButton(
      onPressed: isInCart
          ? null
          : () {
              var cart = context.read<Cart>();
              cart.add(item);
            },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return null; // Defer to the widget"s default.
        }),
      ),
      child: isInCart
          ? const Icon(Icons.check, semanticLabel: 'ADDED')
          : const Text('ADD'),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem(this.index);

  @override
  Widget build(BuildContext context) {
    var item = context
        .select<Catalog, Item>((catalog) => catalog.getByPosition(index));
    var textTheme = Theme.of(context).textTheme.titleLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: Colors.amber,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(item.name, style: textTheme),
            ),
            const SizedBox(width: 24),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}
