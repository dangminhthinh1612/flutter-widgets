import "package:flutter/material.dart";

mixin ModalMixin {
  void showModal(BuildContext context, List<Widget> listWidgets) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: listWidgets,
            ),
          ),
        );
      },
    );
  }
}
