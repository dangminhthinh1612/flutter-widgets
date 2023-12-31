import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/category.dart';
import 'package:flutter_application_1/providers/category_provider.dart';
import 'package:flutter_application_1/widgets/gradient_icon.dart';
import 'package:flutter_application_1/widgets/icon_list.dart';
import 'package:provider/provider.dart';

class CategoryForm extends StatefulWidget {
  final CategoryProvider categoryProvider;
  const CategoryForm({super.key, required this.categoryProvider});

  @override
  State<CategoryForm> createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  final _formKey = GlobalKey<FormState>();
  final textController = TextEditingController();

  Icon? _selectedIcon;
  bool _isExpense = true;
  int? _parentId;
  bool _categoryNameEmpty = true;
  bool _iconEmpty = true;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int newCategoryId = widget.categoryProvider.newId;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Income'),
                    value: false,
                    groupValue: _isExpense,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _isExpense = value;
                          _parentId = null;
                        });
                      }
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Expense'),
                    value: true,
                    groupValue: _isExpense,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _isExpense = value;
                          _parentId = null;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                labelText: 'Parent Category',
                hintText: 'Empty',
                border: OutlineInputBorder(),
              ),
              value: _parentId,
              items: widget.categoryProvider
                  .categoryParents(_isExpense)
                  .map((catParent) {
                return DropdownMenuItem<int>(
                  value: catParent.id,
                  child: Text(catParent.name),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _parentId = value;
                  });
                }
              },
            ),
            TextFormField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Category name',
                border: const OutlineInputBorder(),
                errorBorder:
                    !_categoryNameEmpty ? const OutlineInputBorder() : null,
                focusedErrorBorder:
                    !_categoryNameEmpty ? const OutlineInputBorder() : null,
                labelStyle: !_categoryNameEmpty
                    ? Theme.of(context).textTheme.bodyLarge
                    : null,
                icon: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const IconList();
                      },
                    ).then((value) {
                      if (value != null) {
                        setState(() => _selectedIcon = value);
                      }
                    });
                  },
                  splashColor: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                  child: (_selectedIcon != null)
                      ? GradientIcon(id: newCategoryId, icon: _selectedIcon!)
                      : Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            border: (!_categoryNameEmpty && _iconEmpty)
                                ? Border.all(width: 1, color: Colors.red)
                                : null,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                ),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  setState(() => _categoryNameEmpty = true);
                  return 'Please enter Category name';
                } else if (_selectedIcon == null) {
                  setState(() {
                    _categoryNameEmpty = false;
                    _iconEmpty = true;
                  });
                  return 'Please choose Icon';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: () {
                  var listCategory = context.read<CategoryProvider>();
                  if (_formKey.currentState!.validate()) {
                    listCategory.add(
                      Category(
                        id: newCategoryId,
                        name: textController.text,
                        iconWidget: _selectedIcon!,
                        parentId: _parentId,
                        isOutCome: _isExpense,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ].expand((child) => [child, const SizedBox(height: 8)]).toList(),
        ),
      ),
    );
  }
}
