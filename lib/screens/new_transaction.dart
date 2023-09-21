import "package:flutter/material.dart";
import "package:flutter_application_1/models/category.dart";
import "package:flutter_application_1/providers/category_provider.dart";
import "package:flutter_application_1/widgets/settings/category_tab_bar_view.dart";
import "package:flutter_application_1/widgets/calculator.dart";
import "package:flutter_application_1/widgets/date_picker.dart";
import "package:flutter_application_1/widgets/gradient_icon.dart";
import "package:provider/provider.dart";

class NewTransaction extends StatefulWidget {
  const NewTransaction({super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _formKey = GlobalKey<FormState>();
  String result = "0";
  final myController = TextEditingController(text: "0");
  DateTime currentDate = DateTime.now();
  final categoryController = TextEditingController();
  Category? categorySelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Transaction"),
        actions: [
          IconButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Processing Data")),
                );
              }
            },
            icon: const Icon(Icons.check_rounded),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                readOnly: true,
                controller: myController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Amount*",
                ),
                onTap: () {
                  showModalBottomSheet<String>(
                    context: context,
                    builder: (BuildContext context) {
                      return const SizedBox(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [Expanded(child: Caculator())],
                          ),
                        ),
                      );
                    },
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        result = value;
                      });
                    }
                    myController.text = value ?? result;
                  });
                },
              ),
              TextFormField(
                controller: categoryController,
                readOnly: true,
                decoration: InputDecoration(
                  icon: categorySelected != null
                      ? GradientIcon(
                          id: categorySelected!.id,
                          icon: categorySelected!.iconWidget,
                        )
                      : Icon(
                          Icons.circle,
                          size: 50,
                          color: Colors.grey[300],
                        ),
                  labelText: "Category*",
                  border: const OutlineInputBorder(),
                ),
                onTap: () {
                  var categories = context.read<CategoryProvider>();

                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return DefaultTabController(
                        length: 3,
                        child: Column(
                          children: [
                            const TabBar(
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
                            Expanded(
                              child: CategoryTabBarView(
                                categoryList: categories,
                                type: "transaction",
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).then((value) {
                    if (value == null) return;

                    setState(() => categorySelected = value);
                    categoryController.text = categorySelected!.name;
                  });
                },
              ),
              DatePicker(
                date: currentDate,
                style: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Date*",
                ),
                onChange: (value) {
                  setState(() {
                    currentDate = value;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Note",
                  hintText: "Write some note ...",
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
            ]
                .expand(
                  (element) => [
                    element,
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
