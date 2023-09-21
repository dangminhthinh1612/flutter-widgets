import "package:flutter/material.dart";
import "package:flutter_application_1/mixin/modal_mixin.dart";
import "package:flutter_application_1/providers/category_provider.dart";
import "package:flutter_application_1/widgets/settings/category_form.dart";
import "package:flutter_application_1/widgets/settings/category_tab_bar_view.dart";
import "package:provider/provider.dart";

class CategoryScreen extends StatelessWidget with ModalMixin {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var categoryList = context.watch<CategoryProvider>();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Category Manager"),
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return CategoryForm(
                      categoryModel: categoryList,
                    );
                  },
                );
              },
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
        body: CategoryTabBarView(
          categoryList: categoryList,
          type: "",
        ),
      ),
    );
  }
}
