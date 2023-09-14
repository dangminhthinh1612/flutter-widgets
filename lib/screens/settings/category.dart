import "package:flutter/material.dart";
import "package:flutter_application_1/mixin/modal_mixin.dart";
import "package:flutter_application_1/models/category.dart";
import "package:flutter_application_1/models/category_notifier.dart";
import "package:flutter_application_1/widgets/gradient_icon.dart";
import "package:provider/provider.dart";

class CategoryScreen extends StatelessWidget with ModalMixin {
  const CategoryScreen({super.key});

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
          (catHead) => ExpansionTile(
            title: Text(catHead.name),
            leading: GradientIcon(
              id: catHead.id,
              icon: catHead.iconWidget,
            ),
            shape: const Border(),
            initiallyExpanded: true,
            children: list
                .where(
                  (subSearch) =>
                      subSearch.parentId == catHead.id &&
                      subSearch.isOutCome == isOutCome,
                )
                .map(
                  (catSub) => ListTile(
                    contentPadding: const EdgeInsets.only(left: 40),
                    title: Text(catSub.name),
                    leading: GradientIcon(
                      id: catSub.id,
                      icon: catSub.iconWidget,
                    ),
                  ),
                )
                .toList(),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var categories = context.read<CategoryNotifier>().categories;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Category Manager"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.post_add_rounded),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Loan",
              ),
              Tab(
                text: "Income",
              ),
              Tab(
                text: "Expense",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              // TODO: Add Debt & Loan to Categories
              children: const [Center(child: Text("Debt & Loan"))],
            ),
            ListView(
              children: [
                ...initCategory(
                  list: categories,
                  isOutCome: false,
                ),
              ],
            ),
            ListView(
              children: [
                ...initCategory(
                  list: categories,
                  isOutCome: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
