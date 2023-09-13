import "package:flutter/material.dart";
import "package:flutter_application_1/models/category.dart";

class CategoryNotifier extends ChangeNotifier {
  static List<Category> defaultCategories = [
    const Category(
      id: 1,
      name: "Ăn uống",
      iconWidget: Icon(
        Icons.fastfood_rounded,
        size: 16,
      ),
    ),
    const Category(
      id: 2,
      name: "Mua sắm",
      iconWidget: Icon(
        Icons.shopping_cart_rounded,
        size: 16,
      ),
    ),
    const Category(
      id: 3,
      name: "Di chuyển",
      iconWidget: Icon(
        Icons.commute_rounded,
        size: 16,
      ),
    ),
    const Category(
      id: 4,
      name: "Nhà cửa",
      iconWidget: Icon(
        Icons.cottage_rounded,
        size: 16,
      ),
    ),
    const Category(
      id: 5,
      name: "Giải trí",
      iconWidget: Icon(
        Icons.sports_esports_rounded,
        size: 16,
      ),
    ),
    const Category(
      id: 6,
      name: "Y tế",
      iconWidget: Icon(
        Icons.medical_information_rounded,
        size: 16,
      ),
    ),
    const Category(
      id: 7,
      name: "Hoá đơn",
      iconWidget: Icon(
        Icons.receipt_rounded,
        size: 16,
      ),
    ),
    const Category(
      id: 8,
      name: "Tiết kiệm",
      iconWidget: Icon(
        Icons.savings_rounded,
        size: 16,
      ),
    ),
  ];

  final _categories = defaultCategories;

  List<Category> get categories => _categories;

  void add() {
    // Add new Category
    notifyListeners();
  }
}
