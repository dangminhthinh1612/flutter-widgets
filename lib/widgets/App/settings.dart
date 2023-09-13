import "package:flutter/material.dart";
import "package:flutter_application_1/mixin/modal_mixin.dart";
import "package:flutter_application_1/models/category_notifier.dart";
import "package:flutter_application_1/widgets/gradient_icon.dart";
import "package:provider/provider.dart";

class SettingsScreen extends StatelessWidget with ModalMixin {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.category_rounded),
          title: const Text("Your Categories"),
          onTap: () {
            var categories = context.read<CategoryNotifier>().categories;

            showModal(context, [
              Expanded(
                child: Column(
                  children: categories
                      .map(
                        (category) => ListTile(
                          title: Text(category.name),
                          leading: GradientIcon(
                            id: category.id,
                            icon: category.iconWidget,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ]);
          },
        ),
      ],
    );
  }
}
