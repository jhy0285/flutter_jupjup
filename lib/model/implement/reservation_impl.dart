import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jupjup/constants/enum/reservation_state.dart';
import 'package:jupjup/model/implement/cart_impl.dart';
import 'package:jupjup/model/base.dart';

class Reservation implements Base {
  Reservation({
    int reserveId = -1,
    String customerName = "",
    String customerPhone = "",
    ReservationState state = ReservationState.NEW,
    int visitTime = -1,
    List<Cart>? cartList,
    int storeId = -1,
  }) {
    _reserveId = reserveId;
    _customerName = customerName;
    _customerPhone = customerPhone;
    _state = state;
    _visitTime = visitTime;
    _cartList = cartList;
    _storeId = storeId;
  }

  late int _reserveId;
  int get reserveId => _reserveId;

  late String _customerName;
  String get customerName => _customerName;

  late String _customerPhone;
  String get customerPhone => _customerPhone;

  late ReservationState _state;
  ReservationState get state => _state;
  set state(ReservationState value) {
    state = value;
  }

  late int _visitTime;
  int get visitTime => _visitTime;

  List<Cart>? _cartList;
  List<Cart> get cartList => _cartList!;

  late int _storeId;
  int get storeId => _storeId;

  factory Reservation.fromFirebase(QueryDocumentSnapshot doc) {
    int length = doc['cartList'].length;

    List<Cart> cartList = [];
    for (int i = 0; i < length; i++) {
      cartList.add(Cart.fromJson(doc['cartList'][i]));
    }

    return Reservation(
      reserveId: doc['reserveId'],
      customerName: doc['customerName'],
      customerPhone: doc['customerPhone'],
      state: ReservationState.values.byName(doc['state']),
      visitTime: doc['visitTime'],
      cartList: cartList,
      storeId: doc['storeId'],
    );
  }

  Map<String, dynamic> toFireBase(Reservation reservation) {
    int length = reservation.cartList.length;

    List<Map<String, dynamic>> jsonCartList = [];
    for (int i = 0; i < length; i++) {
      jsonCartList.add({
        "itemId": reservation.cartList[i].itemId,
        "storeId": reservation.cartList[i].storeId,
        "amount": reservation.cartList[i].amount,
        "name": reservation.cartList[i].name,
        "salesPrice": reservation.cartList[i].salesPrice,
      });
    }

    return {
      'reserveId': reservation.reserveId,
      'storeId': reservation.storeId,
      'customerName': reservation.customerName,
      'customerPhone': reservation.customerPhone,
      'visitTime': reservation.visitTime,
      'state': reservation.state.name,
      'cartList': jsonCartList,
    };
  }
}
