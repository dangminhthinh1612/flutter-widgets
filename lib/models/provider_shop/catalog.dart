import 'package:flutter_application_1/models/provider_shop/item.dart';

class Catalog {
  static List<String> itemsName = [
    'rau',
    'củ',
    'quả',
    'thịt',
    'cá',
    'gia cầm',
    'mì gói',
    'đồ ăn nhanh',
    'thức uống đóng chai',
    'đậu phụ',
    'sữa',
    'kem',
    'bơ',
    'đèn',
    'quạt',
    'máy lạnh',
    'tivi',
    'nước rửa chén',
    'xà phòng',
    'bột giặt',
    'kem',
    'pizza đông lạnh',
    'thức ăn chế biến sẵn',
    'xà phòng',
    'kem đánh răng',
    'nước hoa',
    'nồi',
    'chảo',
    'đũa',
    'chén',
    'điện thoại',
    'máy tính',
    'máy ảnh',
    'áo',
    'giày dép',
    'túi xách',
    'mũ',
  ];

  Item getById(int id) => Item(id, itemsName[id % itemsName.length]);

  Item getByPosition(int position) => getById(position);
}
