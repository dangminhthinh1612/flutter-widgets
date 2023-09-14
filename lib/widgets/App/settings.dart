import "package:flutter/material.dart";
import "package:flutter_application_1/mixin/modal_mixin.dart";
import "package:go_router/go_router.dart";

class SettingsScreen extends StatelessWidget with ModalMixin {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.category_rounded),
          title: const Text("Your Categories"),
          onTap: () => context.push("/settings/categories"),
        ),
      ],
    );
  }
}
