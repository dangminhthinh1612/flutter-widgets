import 'package:flutter/material.dart';

mixin ModalMixin {
  List<Widget> get listWidgets;

  void showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 500,
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
