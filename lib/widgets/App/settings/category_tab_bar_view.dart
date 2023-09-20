import "package:flutter/material.dart";
import "package:flutter_application_1/models/category.dart";
import "package:flutter_application_1/models/category_notifier.dart";
import "package:flutter_application_1/widgets/gradient_icon.dart";

class CategoryTabBarView extends StatefulWidget {
  final CategoryNotifier categoryList;
  final String type;

  const CategoryTabBarView({
    super.key,
    required this.categoryList,
    required this.type,
  });

  @override
  State<CategoryTabBarView> createState() => _CategoryTabBarViewState();
}

class _CategoryTabBarViewState extends State<CategoryTabBarView> {
  List<Widget> initCategory({
    required List<Category> list,
    required bool isOutCome,
    required String type,
  }) {
    return list
        .where(
          (catSearch) =>
              catSearch.parentId == null && catSearch.isOutCome == isOutCome,
        )
        .map(
          (catHead) => ListTileHead(
            list: list,
            type: type,
            name: catHead.name,
            id: catHead.id,
            iconWidget: catHead.iconWidget,
            isExpense: isOutCome,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        ListView(
          // TODO: Add Debt & Loan to Categories
          children: const [Center(child: Text("Debt & Loan"))],
        ),
        ListView(
          children: [
            ...initCategory(
              list: widget.categoryList.categories,
              isOutCome: false,
              type: widget.type,
            ),
          ],
        ),
        ListView(
          children: [
            ...initCategory(
              list: widget.categoryList.categories,
              isOutCome: true,
              type: widget.type,
            ),
          ],
        ),
      ],
    );
  }
}

class ListTileHead extends StatefulWidget {
  final List<Category> list;
  final String type;
  final String name;
  final int id;
  final Icon iconWidget;
  final bool isExpense;

  const ListTileHead({
    super.key,
    required this.list,
    required this.type,
    required this.name,
    required this.id,
    required this.iconWidget,
    required this.isExpense,
  });

  @override
  State<ListTileHead> createState() => _ListTileHeadState();
}

class _ListTileHeadState extends State<ListTileHead> {
  bool isOpen = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(widget.name),
          leading: GradientIcon(
            id: widget.id,
            icon: widget.iconWidget,
          ),
          shape: const Border(),
          onTap: () {
            switch (widget.type) {
              case "transaction":
                Navigator.pop(
                  context,
                  Category(
                    id: widget.id,
                    name: widget.name,
                    iconWidget: widget.iconWidget,
                  ),
                );
                break;
            }
          },
          trailing: IconButton(
            icon: Icon(
              isOpen ? Icons.expand_less_rounded : Icons.expand_more_rounded,
            ),
            onPressed: () {
              setState(() {
                isOpen = !isOpen;
              });
            },
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SizeTransition(
              axisAlignment: 1,
              sizeFactor: animation,
              child: child,
            );
          },
          child: isOpen
              ? Column(
                  children: widget.list
                      .where(
                        (subSearch) =>
                            subSearch.parentId == widget.id &&
                            subSearch.isOutCome == widget.isExpense,
                      )
                      .map(
                        (catSub) => ListTile(
                          contentPadding: const EdgeInsets.only(left: 40),
                          title: Text(catSub.name),
                          leading: GradientIcon(
                            id: catSub.id,
                            icon: catSub.iconWidget,
                          ),
                          onTap: () {
                            switch (widget.type) {
                              case "transaction":
                                Navigator.pop(context, catSub);
                                break;
                            }
                          },
                        ),
                      )
                      .toList(),
                )
              : null,
        ),
      ],
    );
  }
}
