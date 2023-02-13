import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jupjup/model/implement/reservation_impl.dart';

abstract class IKakaoAlarmTalkProvider extends ChangeNotifier {
  Future<void> cancelReservationAlarmFromDetail(
    Reservation reservation,
    String storeName,
    String repName,
  );
}
