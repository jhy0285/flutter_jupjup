import 'package:flutter/material.dart';
import 'package:jupjup/model/implement/cart_impl.dart';
import 'package:jupjup/model/implement/reservation_impl.dart';

abstract class IMenuProvider extends ChangeNotifier {
  List<Reservation>? get reservationList;
  List<String> get reservationRepNameList;
  void getReservationList();
  List<String> setReservationRepNameList();
}
