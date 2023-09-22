import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/category.dart';

class CategoryProvider extends ChangeNotifier {
  static List<Category> defaultCategories = [
    const Category(
      id: 1,
      name: 'Lương',
      iconWidget: Icon(Icons.currency_exchange_rounded),
      isOutCome: false,
    ),
    const Category(
      id: 2,
      name: 'Thưởng',
      iconWidget: Icon(Icons.military_tech_rounded),
      isOutCome: false,
    ),
    const Category(
      id: 3,
      name: 'Tiền lãi',
      iconWidget: Icon(Icons.savings_rounded),
      isOutCome: false,
    ),
    const Category(
      id: 4,
      name: 'Thu nhập khác',
      iconWidget: Icon(Icons.add_card_rounded),
      isOutCome: false,
    ),
    const Category(
      id: 5,
      name: 'Trợ cấp',
      iconWidget: Icon(Icons.add_home_rounded),
      isOutCome: false,
    ),
    const Category(
      id: 6,
      name: 'Bán hàng',
      iconWidget: Icon(Icons.add_business_rounded),
      isOutCome: false,
    ),
    const Category(
      id: 7,
      name: 'Ăn uống',
      iconWidget: Icon(Icons.local_dining_rounded),
    ),
    const Category(
      id: 8,
      name: 'Mua sắm',
      iconWidget: Icon(Icons.shopping_cart_rounded),
    ),
    const Category(
      id: 9,
      name: 'Di chuyển',
      iconWidget: Icon(Icons.commute_rounded),
    ),
    const Category(
      id: 10,
      name: 'Nhà cửa',
      iconWidget: Icon(Icons.cottage_rounded),
    ),
    const Category(
      id: 11,
      name: 'Giải trí',
      iconWidget: Icon(Icons.sports_esports_rounded),
    ),
    const Category(
      id: 12,
      name: 'Y tế',
      iconWidget: Icon(Icons.medical_information_rounded),
    ),
    const Category(
      id: 13,
      name: 'Hoá đơn',
      iconWidget: Icon(Icons.receipt_rounded),
    ),
    const Category(
      id: 14,
      name: 'Tiết kiệm',
      iconWidget: Icon(Icons.savings_rounded),
    ),
    const Category(
      id: 15,
      name: 'Khác',
      iconWidget: Icon(Icons.post_add_rounded),
    ),
    const Category(
      id: 16,
      name: 'Đồ ăn',
      iconWidget: Icon(Icons.lunch_dining_rounded),
      parentId: 7,
    ),
    const Category(
      id: 17,
      name: 'Nhà hàng',
      iconWidget: Icon(Icons.restaurant_rounded),
      parentId: 7,
    ),
    const Category(
      id: 18,
      name: 'Cà phê',
      iconWidget: Icon(Icons.coffee_rounded),
      parentId: 7,
    ),
    const Category(
      id: 19,
      name: 'Thức uống',
      iconWidget: Icon(Icons.local_bar_rounded),
      parentId: 7,
    ),
    const Category(
      id: 20,
      name: 'Cá nhân',
      iconWidget: Icon(Icons.assignment_ind_rounded),
      parentId: 8,
    ),
    const Category(
      id: 21,
      name: 'Quần áo',
      iconWidget: Icon(Icons.checkroom_rounded),
      parentId: 8,
    ),
    const Category(
      id: 22,
      name: 'Đồ gia dụng',
      iconWidget: Icon(Icons.widgets_rounded),
      parentId: 8,
    ),
    const Category(
      id: 23,
      name: 'Xăng dầu',
      iconWidget: Icon(Icons.local_gas_station_rounded),
      parentId: 9,
    ),
    const Category(
      id: 24,
      name: 'Vé xe bus',
      iconWidget: Icon(Icons.directions_bus_rounded),
      parentId: 9,
    ),
    const Category(
      id: 25,
      name: 'Vé máy bay',
      iconWidget: Icon(Icons.local_airport_rounded),
      parentId: 9,
    ),
    const Category(
      id: 26,
      name: 'Taxi',
      iconWidget: Icon(Icons.local_taxi_rounded),
      parentId: 9,
    ),
    const Category(
      id: 27,
      name: 'Tiền thuê nhà',
      iconWidget: Icon(Icons.add_home_rounded),
      parentId: 13,
    ),
    const Category(
      id: 28,
      name: 'Tiền điện',
      iconWidget: Icon(Icons.electric_meter_rounded),
      parentId: 13,
    ),
    const Category(
      id: 29,
      name: 'Tiền nước',
      iconWidget: Icon(Icons.water_damage_rounded),
      parentId: 13,
    ),
    const Category(
      id: 30,
      name: 'Tiền internet',
      iconWidget: Icon(Icons.router_rounded),
      parentId: 13,
    ),
    const Category(
      id: 31,
      name: 'Tiền điện thoại',
      iconWidget: Icon(Icons.book_online_rounded),
      parentId: 13,
    ),
    const Category(
      id: 32,
      name: 'Xem phim',
      iconWidget: Icon(Icons.local_movies_rounded),
      parentId: 11,
    ),
    const Category(
      id: 33,
      name: 'Xem concert',
      iconWidget: Icon(Icons.face_retouching_natural_rounded),
      parentId: 11,
    ),
    const Category(
      id: 34,
      name: 'Du lịch',
      iconWidget: Icon(Icons.luggage_rounded),
      parentId: 11,
    ),
    const Category(
      id: 35,
      name: 'Bảo hiểm sức khỏe',
      iconWidget: Icon(Icons.health_and_safety_rounded),
      parentId: 12,
    ),
    const Category(
      id: 36,
      name: 'Thuốc men',
      iconWidget: Icon(Icons.medication_rounded),
      parentId: 12,
    ),
    const Category(
      id: 37,
      name: 'Khám bệnh',
      iconWidget: Icon(Icons.person_search_rounded),
      parentId: 12,
    ),
    const Category(
      id: 38,
      name: 'Đầu tư',
      iconWidget: Icon(Icons.domain_add_rounded),
    ),
  ];

  final _categories = defaultCategories;

  List<Category> get categories => _categories;

  int get newId => _categories.length + 1;

  List<Category> categoryParents(bool isExpense) =>
      _categories.where((category) {
        return category.parentId == null && category.isOutCome == isExpense;
      }).toList();

  List<Category> categorySubs(Category catHead) =>
      _categories.where((category) {
        return category.parentId == catHead.id;
      }).toList();

  void add(Category category) {
    _categories.add(category);

    notifyListeners();
  }
}
