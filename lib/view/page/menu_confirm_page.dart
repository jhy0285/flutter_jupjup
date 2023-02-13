import 'package:flutter/material.dart';
import 'package:jupjup/model/implement/cart_impl.dart';
import 'package:jupjup/model/implement/reservation_impl.dart';
import 'package:jupjup/viewmodel/impl/kakao_alarm_talk_provider_impl.dart';
import 'package:jupjup/viewmodel/impl/menu_provider_impl.dart';

import 'package:provider/provider.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        titleSpacing: 0,
        leading: IconButton(
          color: Color(0xffE49318),
          icon: Icon(Icons.arrow_back_ios_outlined),
          iconSize: 25,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '예약 상황',
          style: TextStyle(
            fontFamily: "Pretendard",
            fontSize: 22,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w400,
            color: Color(0xffE49318),
          ),
        ),
      ),
      body: SafeArea(
        child: Consumer<MenuProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 300,
                      margin: EdgeInsets.only(left: 16, top: 15),
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        provider.reservationRepNameList[provider.selectedIndex],
                        style: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: 34,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xff855BF9),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        width: 75,
                        height: 37,
                        margin: EdgeInsets.only(right: 17, top: 15),
                        child: Center(
                          child: Text(
                            provider
                                .reservationList![provider.selectedIndex].state
                                .toString(),
                            style: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: 15,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    provider.getReservationTimeText(provider
                        .reservationList![provider.selectedIndex].reserveId),
                    style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffC8BCAB)),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 16),
                    child: Text(
                      "주문자 정보",
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: 20,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    )),
                SizedBox(height: 29),
                Row(
                  children: [
                    SizedBox(width: 16),
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffEAE5DF),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 97,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xffC8BCAB),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        margin:
                                            EdgeInsets.only(left: 16, top: 16),
                                        width: 30,
                                        height: 30,
                                        child: Icon(
                                          Icons.person_outline,
                                          color: Color(0xffF5F5F5),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 54, top: 16),
                                      child: Text(
                                        "주문자",
                                        style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontSize: 12,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffE49318),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 54, top: 37),
                                      child: Text(
                                        provider
                                            .reservationList![
                                                provider.selectedIndex]
                                            .customerName,
                                        style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontSize: 17,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 54, top: 63),
                                      child: Text(
                                        provider.getCustomerPhoneText(provider
                                            .reservationList![
                                                provider.selectedIndex]
                                            .customerPhone),
                                        style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontSize: 13,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffAFA08A),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(color: Colors.white, height: 3),
                              Container(
                                height: 74,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xffC8BCAB),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        margin:
                                            EdgeInsets.only(left: 16, top: 16),
                                        width: 30,
                                        height: 30,
                                        child: Icon(
                                          Icons.watch_later_outlined,
                                          color: Color(0xffF5F5F5),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 54, top: 16),
                                      child: Text(
                                        "방문 예정 시간",
                                        style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontSize: 12,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffE49318),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 54, top: 37),
                                      child: Text(
                                        provider.getVisitTimeText(provider
                                            .reservationList![
                                                provider.selectedIndex]
                                            .visitTime),
                                        style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontSize: 17,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(width: 16),
                  ],
                ),
                SizedBox(height: 46),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 16),
                  child: Text(
                    "주문 내역",
                    style: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: 20,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 21),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(width: 16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: provider
                              .reservationList![provider.selectedIndex]
                              .cartList
                              .length,
                          itemBuilder: ((context, index) {
                            return Column(
                              children: [
                                Container(
                                  height: 73,
                                  child: Stack(children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 15, left: 16),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        provider
                                            .reservationList![
                                                provider.selectedIndex]
                                            .cartList[index]
                                            .name,
                                        style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontSize: 17,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 40, left: 16),
                                      child: Text(
                                        "${provider.reservationList![provider.selectedIndex].cartList[index].salesPrice}원",
                                        style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontSize: 13,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffE49318),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      margin: EdgeInsets.only(right: 50.5),
                                      child: Text(
                                        "${provider.reservationList![provider.selectedIndex].cartList[index].amount} 개",
                                        style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontSize: 17,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ]),
                                ),
                                SizedBox(height: 8),
                              ],
                            );
                          }),
                        ),
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 16),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                fixedSize: Size(170.5, 62),
                                backgroundColor: Color(0xffE31E1E)),
                            onPressed: () async {
                              await provider.cancelReservation(from: 'confirm');
                              await Provider.of<KakaoAlarmTalkProvider>(context,
                                      listen: false)
                                  .cancelReservationAlarmFromConfirm(
                                      provider.reservationList![
                                          provider.selectedIndex],
                                      provider.storeName,
                                      provider.reservationRepNameList[
                                          provider.selectedIndex],
                                      provider.getVisitTimeText(provider
                                          .reservationList![
                                              provider.selectedIndex]
                                          .visitTime));
                              Navigator.pushNamedAndRemoveUntil(
                                  context, 'main', (route) => false);
                            },
                            child: Text(
                              "취소",
                              style: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: 17,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                fixedSize: Size(170.5, 62),
                                backgroundColor: Color(0xff56D578)),
                            onPressed: () async {
                              await provider.completeReservation();
                              Navigator.pushNamedAndRemoveUntil(
                                  context, 'main', (route) => false);
                            },
                            child: Text(
                              "완료",
                              style: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: 17,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                  ],
                ),
                SizedBox(height: 29)
              ],
            );
          },
        ),
      ),
    );
  }
}
