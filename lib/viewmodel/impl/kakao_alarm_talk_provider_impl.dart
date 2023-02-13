import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:jupjup/model/implement/reservation_impl.dart';
import 'package:jupjup/viewmodel/kakao_alarm_talk_provider.dart';

class KakaoAlarmTalkProvider extends ChangeNotifier
    implements IKakaoAlarmTalkProvider {
  @override
  Future<void> cancelReservationAlarmFromDetail(
    Reservation reservation,
    String storeName,
    String repName,
  ) async {
    String customerName = reservation.customerName;
    String customerPhone = reservation.customerPhone;

    Client client = Client();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    Uri url =
        Uri.parse('https://jupiter.lunasoft.co.kr/api/AlimTalk/message/send');
    Map<String, dynamic> request = {
      "api_key": "6n4febhj7eojs6f2sqjuhw2qh1qpawqdl5mcyw0v",
      "messages": [
        {
          "btn_url": [
            {
              "url_pc": "https://instabio.cc/zupzup",
              "url_mobile": "https://instabio.cc/zupzup"
            }
          ],
          "msg_content":
              "<매진으로 인한 예약 취소 안내>\n\n$customerName님 예약하신 제품들이 모두 매진되어 예약이 취소되었습니다.\n\n취소된 예약에 대해 안내드립니다.\n\n-예약매장: $storeName\n-예약제품:$repName\n\n\n* 현재 매장의 재고량을 반영하여 주문페이지가 업데이트되었으니 한 번 더 제품을 확인해보세요.\n\n줍줍을 이용해주셔서 감사합니다:)",
          "no": "0",
          "sms_content": "",
          "tel_num": customerPhone,
          "use_sms": "0"
        }
      ],
      "template_id": 50067,
      "userid": "zupzup"
    };
    try {
      Response res =
          await client.post(url, headers: headers, body: jsonEncode(request));

      if (res.statusCode != 200) {
        debugPrint("cancelReservationAlarmFromDetail함수 statusCode가 200이 아닙니다");
      } else {
        Map<String, dynamic> body = jsonDecode(res.body);
        Fluttertoast.showToast(
            msg: "매진으로 인한 취소 카톡 전송 성공",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.blueAccent,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "전송 실패, ${e.toString()}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.blueAccent,
          textColor: Colors.white,
          fontSize: 16.0);
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<void> confirmReservationAlarm(
    Reservation reservation,
    String storeName,
    String repName,
    String visitTime,
  ) async {
    String customerName = reservation.customerName;
    String customerPhone = reservation.customerPhone;
    Client client = Client();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    Uri url =
        Uri.parse('https://jupiter.lunasoft.co.kr/api/AlimTalk/message/send');
    Map<String, dynamic> request = {
      "api_key": "6n4febhj7eojs6f2sqjuhw2qh1qpawqdl5mcyw0v",
      "messages": [
        {
          "btn_url": [
            {
              "url_pc": "https://instabio.cc/zupzupplace",
              "url_mobile": "https://instabio.cc/zupzupplace"
            }
          ],
          "msg_content":
              "<예약 확정 안내>\n\n$customerName님 예약이 확정되었습니다.\n시간에 맞게 매장으로 방문 부탁드립니다.\n\n-예약매장:$storeName\n-예약제품:$repName\n-예정방문시간:$visitTime\n\n\n*예약취소를 원하시거나 문의사항이 있으시면 상담직원에게 메시지를 보내주시기 바랍니다.\n\n줍줍을 이용해 주셔서 감사합니다 :)",
          "no": "0",
          "sms_content": "",
          "tel_num": customerPhone,
          "use_sms": "0"
        }
      ],
      "template_id": 50062,
      "userid": "zupzup"
    };
    try {
      Response res =
          await client.post(url, headers: headers, body: jsonEncode(request));

      if (res.statusCode != 200) {
        debugPrint("confirmReservationAlarm함수 statusCode가 200이 아닙니다");
      } else {
        Map<String, dynamic> body = jsonDecode(res.body);
        Fluttertoast.showToast(
            msg: "예약 확정 카톡 전송 성공",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.blueAccent,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "카톡 전송 실패, ${e.toString()}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.blueAccent,
          textColor: Colors.white,
          fontSize: 16.0);
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<void> partiallyConfirmReservationAlarm(
    Reservation reservation,
    String storeName,
    String repName,
    String visitTime,
  ) async {
    String customerName = reservation.customerName;
    String customerPhone = reservation.customerPhone;
    Client client = Client();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    Uri url =
        Uri.parse('https://jupiter.lunasoft.co.kr/api/AlimTalk/message/send');
    Map<String, dynamic> request = {
      "api_key": "6n4febhj7eojs6f2sqjuhw2qh1qpawqdl5mcyw0v",
      "messages": [
        {
          "btn_url": [
            {
              "url_pc": "https://instabio.cc/zupzupplace",
              "url_mobile": "https://instabio.cc/zupzupplace"
            }
          ],
          "msg_content":
              "<예약 부분 확정 안내>\n\n$customerName님 현재 남은 제품들을 반영하여 주문이 수정되었습니다.주문내역을 확인해주세요.\n시간에 맞게 매장으로 방문 부탁드립니다.\n\n-예약매장:$storeName\n-예약제품:$repName\n-예정방문시간:$visitTime\n\n\n*예약취소를 원하시거나 문의사항이 있으시면 상담직원에게 메시지를 보내주시기 바랍니다.\n\n줍줍을 이용해 주셔서 감사합니다:)",
          "no": "0",
          "sms_content": "",
          "tel_num": customerPhone,
          "use_sms": "0"
        }
      ],
      "template_id": 50063,
      "userid": "zupzup"
    };
    try {
      Response res =
          await client.post(url, headers: headers, body: jsonEncode(request));

      if (res.statusCode != 200) {
        debugPrint("partiallyConfirmReservationAlarm함수 statusCode가 200이 아닙니다");
      } else {
        Map<String, dynamic> body = jsonDecode(res.body);
        Fluttertoast.showToast(
            msg: "예약 부분 확정 카톡 전송 성공",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.blueAccent,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "전송실패, ${e.toString()}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.blueAccent,
          textColor: Colors.white,
          fontSize: 16.0);
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<void> cancelReservationAlarmFromConfirm(
    Reservation reservation,
    String storeName,
    String repName,
    String visitTime,
  ) async {
    String customerName = reservation.customerName;
    String customerPhone = reservation.customerPhone;
    Client client = Client();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    Uri url =
        Uri.parse('https://jupiter.lunasoft.co.kr/api/AlimTalk/message/send');
    Map<String, dynamic> request = {
      "api_key": "6n4febhj7eojs6f2sqjuhw2qh1qpawqdl5mcyw0v",
      "messages": [
        {
          "msg_content":
              "<예약취소 안내>\n\n안녕하세요.$customerName님!\n\n취소된 예약에 대해 안내드립니다.\n\n-예약매장: $storeName\n-예약제품:$repName\n-예정방문시간:$visitTime\n\n\n*문의사항이 있으시면 상담직원에게 메시지를 보내주시기 바랍니다.",
          "no": "0",
          "sms_content": "",
          "tel_num": customerPhone,
          "use_sms": "0"
        }
      ],
      "template_id": 50064,
      "userid": "zupzup"
    };
    try {
      Response res =
          await client.post(url, headers: headers, body: jsonEncode(request));

      if (res.statusCode != 200) {
        debugPrint("cancelReservationAlarmFromConfirm함수 statusCode가 200이 아닙니다");

        Fluttertoast.showToast(
            msg: "${res.statusCode}그리고 code 200아님",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.blueAccent,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Map<String, dynamic> body = jsonDecode(res.body);
        dynamic;

        debugPrint(body.toString());
        Fluttertoast.showToast(
            msg: "예약 취소 카톡 전송 성공",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.blueAccent,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "전송실패, ${e.toString()}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.blueAccent,
          textColor: Colors.white,
          fontSize: 16.0);
      debugPrint(e.toString());
      return null;
    }
  }
}
