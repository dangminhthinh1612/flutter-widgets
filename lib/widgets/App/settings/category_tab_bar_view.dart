import "package:flutter/material.dart";
import "package:flutter_application_1/models/category.dart";
import "package:flutter_application_1/models/category_notifier.dart";
import "package:flutter_application_1/widgets/gradient_icon.dart";

class CategoryTabBarView extends StatefulWidget {
  final CategoryNotifier categoryList;

  const CategoryTabBarView({super.key, required this.categoryList});

  @override
  State<CategoryTabBarView> createState() => _CategoryTabBarViewState();
}

class _CategoryTabBarViewState extends State<CategoryTabBarView> {
  List<Widget> initCategory({
    required List<Category> list,
    required bool isOutCome,
  }) {
    return list
        .where(
          (catSearch) =>
              catSearch.parentId == null && catSearch.isOutCome == isOutCome,
        )
        .map(
          (catHead) => ListTileHead(
            list: list,
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
            ),
          ],
        ),
        ListView(
          children: [
            ...initCategory(
              list: widget.categoryList.categories,
              isOutCome: true,
            ),
          ],
        ),
      ],
    );
  }
}

class ListTileHead extends StatefulWidget {
  final List<Category> list;
  final String name;
  final int id;
  final Icon iconWidget;
  final bool isExpense;

  const ListTileHead({
    super.key,
    required this.list,
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
            // TODO: Action onTap
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
                            // TODO: Action onTap
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
