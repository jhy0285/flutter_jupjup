import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jupjup/constants/enum/reservation_state.dart';
import 'package:jupjup/model/implement/cart_impl.dart';
import 'package:jupjup/model/implement/reservation_impl.dart';
import 'package:jupjup/repo/impl/firebase_repo_impl.dart';
import 'package:jupjup/viewmodel/menu_provider.dart';

class MenuProvider extends ChangeNotifier implements IMenuProvider {
  final FirebaseRepo _repo;
  MenuProvider({FirebaseRepo? repo}) : _repo = repo ?? FirebaseRepo();

  List<Reservation>? _reservationList;
  @override
  List<Reservation>? get reservationList => _reservationList;

  List<String> _reservationRepNameList = [];
  @override
  List<String> get reservationRepNameList => _reservationRepNameList;

  late int _selectedIndex;
  @override
  int get selectedIndex => _selectedIndex;

  List<int> _initialCartAmountList = [];
  @override
  List<int> get initialCartAmountList => _initialCartAmountList;

  late String _storeName;
  @override
  String get storeName => _storeName;

  @override
  Future<List<Reservation>?> getReservationList() async {
    _reservationList = await _repo.getReservationListByStoreId();
    setReservationRepNameList();

    return reservationList;
  }

  @override
  Future<void> getStoreNameByStoreId() async {
    _storeName = await _repo.getStoreNameByStoreId();
  }

  @override
  String getReservationTimeText(timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String formatDate = DateFormat('yyyy년 MM월 dd일 HH:mm').format(dateTime);
    return formatDate + " (예약한 시간)";
  }

  @override
  String getCustomerPhoneText(String phone) {
    return phone.substring(0, 3) +
        '-' +
        phone.substring(3, 7) +
        '-' +
        phone.substring(7);
  }

  @override
  void setSelectedIndex(index) {
    _selectedIndex = index;
    rememberInitialCartAmountList();
  }

  @override
  void rememberInitialCartAmountList() {
    for (int i = 0; i < reservationList![selectedIndex].cartList.length; i++) {
      initialCartAmountList
          .add(reservationList![selectedIndex].cartList[i].amount);
    }
  }

  @override
  List<String> setReservationRepNameList() {
    int length = reservationList!.length;

    for (int i = 0; i < length; i++) {
      List<Cart> cartList = reservationList![i].cartList;

      if (cartList.length > 1) {
        _reservationRepNameList
            .add("${cartList[0].name} 외 ${cartList.length - 1}종");
      } else if (cartList.length == 1) {
        _reservationRepNameList.add(cartList[0].name);
      } else {
        _reservationRepNameList.add("구입한 물품 없음");
      }
    }
    return reservationRepNameList;
  }

  @override
  String getVisitTimeText(int visitTime) {
    List<String> digits = visitTime.toString().split('');
    digits.length <= 2
        ? {
            digits.insert(0, "0"),
            digits.insert(0, "0"),
            digits.insert(digits.length - 2, ':'),
          }
        : digits.insert(digits.length - 2, ':');
    String result = digits.join('');
    return result;
  }

  @override
  int getTotalPrice() {
    int total = 0;
    for (int i = 0; i < reservationList![selectedIndex].cartList.length; i++) {
      total += reservationList![selectedIndex].cartList[i].salesPrice *
          reservationList![selectedIndex].cartList[i].amount;
    }
    return total;
  }

  @override
  void minusCartAmount(idx) {
    reservationList![selectedIndex].cartList[idx].amount == 0
        ? null
        : reservationList![selectedIndex].cartList[idx].amount -= 1;
    notifyListeners();
  }

  @override
  void plusCartAmount(idx) {
    reservationList![selectedIndex].cartList[idx].amount += 1;
    notifyListeners();
  }

  @override
  void initCartListAmount() {
    for (int i = 0; i < reservationList![selectedIndex].cartList.length; i++) {
      reservationList![selectedIndex].cartList[i].amount =
          _initialCartAmountList[i];
    }
  }

  @override
  bool checkCartListAmountIsInit() {
    for (int i = 0; i < reservationList![selectedIndex].cartList.length; i++) {
      if (reservationList![selectedIndex].cartList[i].amount !=
          _initialCartAmountList[i]) {
        return false;
      }
    }
    return true;
  }

  @override
  Future<void> cancelReservation({required String from}) async {
    reservationList![selectedIndex].state = ReservationState.CANCEL;
    switch (from) {
      case "detail":
        initCartListAmount();
        break;
      case "confirm":
        break;
      default:
    }
    await _repo.updateReservation(reservationList![selectedIndex]);
  }

  @override
  Future<void> confirmReservation() async {
    reservationList![selectedIndex].state = ReservationState.CONFIRM;
    await _repo.updateReservation(reservationList![selectedIndex]);
  }

  @override
  Future<void> completeReservation() async {
    reservationList![selectedIndex].state = ReservationState.COMPLETE;
    await _repo.updateReservation(reservationList![selectedIndex]);
  }
}
