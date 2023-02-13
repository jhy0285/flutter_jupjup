import 'package:flutter/material.dart';
import 'package:jupjup/model/base.dart';

class Cart implements Base {
  Cart({
    itemId = -1,
    amount = -1,
    name = "",
    salesPrice = -1,
    storeId = -1,
  }) {
    _itemId = itemId;
    _amount = amount;
    _name = name;
    _salesPrice = salesPrice;
    _storeId = storeId;
  }

  late int _itemId;
  int get itemId => _itemId;

  late int _amount = -1;
  int get amount => _amount;
  set amount(int value) {
    amount = value;
  }

  late String _name;
  String get name => _name;

  late int _salesPrice;
  int get salesPrice => _salesPrice;

  late int _storeId;
  int get storeId => _storeId;

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      itemId: json['itemId'],
      amount: json['amount'],
      name: json['name'],
      salesPrice: json['salesPrice'],
      storeId: json['storeId'],
    );
  }
}
