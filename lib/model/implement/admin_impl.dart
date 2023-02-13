import 'package:flutter/material.dart';
import 'package:jupjup/model/base.dart';

class Admin implements Base {
  Admin({
    id = "",
    passWord = "",
    storeId = -1,
  }) {
    _id = id;
    _passWord = passWord;
    _storeId = storeId;
  }

  late String _id;
  late String _passWord;
  late int _storeId;
}
