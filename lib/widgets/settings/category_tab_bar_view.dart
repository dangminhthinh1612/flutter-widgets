import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/category.dart';
import 'package:flutter_application_1/providers/category_provider.dart';
import 'package:flutter_application_1/widgets/gradient_icon.dart';

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
    required CategoryProvider categoryList,
    required bool isExpense,
    required String type,
  }) {
    return categoryList
        .categoryParents(isExpense)
        .map(
          (catHead) => ListTileHead(
            type: type,
            categoryHead: catHead,
            categorySubs: categoryList.categorySubs(catHead),
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
          children: const [Center(child: Text('Debt & Loan'))],
        ),
        ListView(
          children: [
            ...initCategory(
              categoryList: widget.categoryList,
              isExpense: false,
              type: widget.type,
            ),
          ],
        ),
        ListView(
          children: [
            ...initCategory(
              categoryList: widget.categoryList,
              isExpense: true,
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
              case 'transaction':
                Navigator.pop(context, widget.categoryHead);
                break;
              case 'list':
                // TODO: Update category
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
                              case 'transaction':
                                Navigator.pop(context, catSub);
                                break;
                              case 'list':
                                // TODO: Update category
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
