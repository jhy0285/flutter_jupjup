import 'package:flutter/material.dart';
import 'package:jupjup/model/implement/merchandise_impl.dart';
import 'package:jupjup/model/base.dart';

class Store implements Base {
  Store({
    storeId = -1,
    name = "",
    address = "",
    eventList,
    openTime = "",
    saleTimeEnd = -1,
    saleTimeStart = -1,
    latitude = -1,
    longitude = -1,
    hostPhoneNumber = "",
    merchandiseList,
  }) {
    _storeId = storeId;
    _name = name;
    _address = address;
    _eventList = eventList;
    _openTime = openTime;
    _saleTimeEnd = saleTimeEnd;
    _saleTimeStart = saleTimeStart;
    _latitude = latitude;
    _longitude = longitude;
    _hostPhoneNumber = hostPhoneNumber;
    _merchandiseList = merchandiseList;
  }

  late int _storeId;
  late String _name;
  late String _address;
  late List<String>? _eventList;
  late String _openTime;
  late int _saleTimeEnd;
  late int _saleTimeStart;
  late double _latitude;
  late double _longitude;
  late String _hostPhoneNumber;
  late List<Merchandise>? _merchandiseList;
}
