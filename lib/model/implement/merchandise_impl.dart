import 'package:jupjup/model/base.dart';

class Merchandise implements Base {
  Merchandise({
    itemId = -1,
    discounted = -1,
    imgUrl = "",
    itemName = "",
    price = -1,
    storeId = -1,
    stock = -1,
  }) {
    _itemId = itemId;
    _discounted = discounted;
    _imgUrl = imgUrl;
    _itemName = itemName;
    _price = price;
    _storeId = storeId;
    _stock = stock;
  }
  late int _itemId;
  late int _discounted;
  late String _imgUrl;
  late String _itemName;
  late int _price;
  late int _storeId;
  late int _stock;
}
