import "package:flutter/material.dart";
import "package:flutter_application_1/models/category.dart";
import "package:flutter_application_1/providers/category_provider.dart";
import "package:flutter_application_1/widgets/gradient_icon.dart";

class CategoryTabBarView extends StatefulWidget {
  final CategoryProvider categoryList;
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
            type: type,
            categoryHead: catHead,
            categorySubs: list.where((subSearch) {
              return subSearch.parentId == catHead.id &&
                  subSearch.isOutCome == isOutCome;
            }).toList(),
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
  final String type;
  final Category categoryHead;
  final List<Category> categorySubs;

  const ListTileHead({
    super.key,
    required this.type,
    required this.categoryHead,
    required this.categorySubs,
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
          title: Text(widget.categoryHead.name),
          leading: GradientIcon(
            id: widget.categoryHead.id,
            icon: widget.categoryHead.iconWidget,
          ),
          shape: const Border(),
          onTap: () {
            switch (widget.type) {
              case "transaction":
                Navigator.pop(context, widget.categoryHead);
                break;
            }
          },
          trailing: IconButton(
            icon: Icon(
              isOpen ? Icons.expand_less_rounded : Icons.expand_more_rounded,
            ),
            onPressed: () {
              setState(() => isOpen = !isOpen);
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
                  children: widget.categorySubs
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
