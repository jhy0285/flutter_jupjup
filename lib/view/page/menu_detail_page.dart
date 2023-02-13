import 'package:flutter/material.dart';
import 'package:jupjup/model/implement/cart_impl.dart';
import 'package:jupjup/model/implement/reservation_impl.dart';
import 'package:jupjup/viewmodel/impl/kakao_alarm_talk_provider_impl.dart';
import 'package:jupjup/viewmodel/impl/menu_provider_impl.dart';

import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    MenuProvider providerRead =
        Provider.of<MenuProvider>(context, listen: false);

    return WillPopScope(
      onWillPop: () async {
        providerRead.initCartListAmount();
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          titleSpacing: 0,
          leading: IconButton(
            color: Color(0xffE49318),
            icon: Icon(Icons.arrow_back_ios_outlined),
            iconSize: 25,
            onPressed: () {
              providerRead.initCartListAmount();
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
                          provider
                              .reservationRepNameList[provider.selectedIndex],
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
                            color: Color.fromRGBO(255, 189, 0, 0.8),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          width: 75,
                          height: 37,
                          margin: EdgeInsets.only(right: 17, top: 15),
                          child: Center(
                            child: Text(
                              provider.reservationList![provider.selectedIndex]
                                  .state
                                  .toString(),
                              style: TextStyle(
                                  fontFamily: "Pretendard",
                                  fontSize: 15,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff17181A)),
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
                                          margin: EdgeInsets.only(
                                              left: 16, top: 16),
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
                                          margin: EdgeInsets.only(
                                              left: 16, top: 16),
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
                                          provider.getVisitTimeText(
                                            provider
                                                .reservationList![
                                                    provider.selectedIndex]
                                                .visitTime,
                                          ),
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
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  providerRead
                                                      .minusCartAmount(index);
                                                },
                                                icon: Icon(
                                                  Icons.remove_circle,
                                                  color: Color(0xffEAE5DF),
                                                )),
                                            Text(
                                              provider
                                                  .reservationList![
                                                      provider.selectedIndex]
                                                  .cartList[index]
                                                  .amount
                                                  .toString(),
                                              style: TextStyle(
                                                fontFamily: "Pretendard",
                                                fontSize: 17,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  providerRead
                                                      .plusCartAmount(index);
                                                },
                                                icon: Icon(
                                                  Icons.add_circle,
                                                  color: Color(0xffEAE5DF),
                                                )),
                                            SizedBox(width: 10)
                                          ],
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

                        ////
                        SizedBox(width: 16),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                          fixedSize: Size(358, 64),
                          backgroundColor: Color(0xffE49318)),
                      onPressed: () {
                        showModalBottomSheet<void>(
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              // color: Colors.amber,
                              height: 480,
                              child: Row(
                                children: [
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            margin: EdgeInsets.only(top: 32),
                                            child: Text(
                                              '해당 주문을 확정할까요?',
                                              style: TextStyle(
                                                fontFamily: "Pretendard",
                                                fontSize: 20,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              '아래 주문 내역을 확인해주세요.',
                                              style: TextStyle(
                                                fontFamily: "Pretendard",
                                                fontSize: 12,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 24),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Color(0xffF5F5F5),
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            height: 97,
                                            child: Row(
                                              children: [
                                                Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xffC8BCAB),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        margin: EdgeInsets.only(
                                                            left: 16, top: 16),
                                                        width: 30,
                                                        height: 30,
                                                        child: Icon(
                                                          Icons.person_outline,
                                                          color:
                                                              Color(0xffF5F5F5),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 54, top: 16),
                                                      child: Text(
                                                        "주문자",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "Pretendard",
                                                          fontSize: 12,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Color(0xffE49318),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 54, top: 37),
                                                      child: Text(
                                                        provider
                                                            .reservationList![
                                                                provider
                                                                    .selectedIndex]
                                                            .customerName,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "Pretendard",
                                                          fontSize: 17,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 54, top: 63),
                                                      child: Text(
                                                        provider.getCustomerPhoneText(
                                                            provider
                                                                .reservationList![
                                                                    provider
                                                                        .selectedIndex]
                                                                .customerPhone),
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "Pretendard",
                                                          fontSize: 13,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              Color(0xffAFA08A),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xffC8BCAB),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        margin: EdgeInsets.only(
                                                            left: 70, top: 16),
                                                        width: 30,
                                                        height: 30,
                                                        child: Icon(
                                                          Icons
                                                              .watch_later_outlined,
                                                          color:
                                                              Color(0xffF5F5F5),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 108, top: 16),
                                                      child: Text(
                                                        "방문 예정 시간",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "Pretendard",
                                                          fontSize: 12,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Color(0xffE49318),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 108, top: 37),
                                                      child: Text(
                                                        provider.getVisitTimeText(
                                                            provider
                                                                .reservationList![
                                                                    provider
                                                                        .selectedIndex]
                                                                .visitTime),
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "Pretendard",
                                                          fontSize: 17,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Color(0xffF5F5F5),
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            height: 170,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 16, top: 18.43),
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    "총 합계",
                                                    style: TextStyle(
                                                      fontFamily: "Pretendard",
                                                      fontSize: 15,
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.topRight,
                                                  margin: EdgeInsets.only(
                                                      top: 16, right: 16),
                                                  child: Text(
                                                    "${provider.getTotalPrice()}원", //get total 함수
                                                    style: TextStyle(
                                                      fontFamily: "Pretendard",
                                                      fontSize: 20,
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xffE49318),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        top: 52,
                                                        left: (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width -
                                                                32 -
                                                                326) /
                                                            2),
                                                    width: 326,
                                                    child: Divider(
                                                        color:
                                                            Color(0xffEAE5DF),
                                                        thickness: 2.0)),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 60),
                                                  child: ListView.builder(
                                                    itemCount: provider
                                                        .reservationList![
                                                            provider
                                                                .selectedIndex]
                                                        .cartList
                                                        .length,
                                                    itemBuilder:
                                                        ((context, index) {
                                                      return Column(
                                                        children: [
                                                          Container(
                                                            height: 36,
                                                            child: Stack(
                                                                children: [
                                                                  Container(
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            130),
                                                                    alignment:
                                                                        Alignment
                                                                            .centerRight,
                                                                    child: Text(
                                                                      provider
                                                                          .reservationList![provider
                                                                              .selectedIndex]
                                                                          .cartList[
                                                                              index]
                                                                          .name,
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            "Pretendard",
                                                                        fontSize:
                                                                            15,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            90),
                                                                    alignment:
                                                                        Alignment
                                                                            .centerRight,
                                                                    child: Text(
                                                                      "${provider.reservationList![provider.selectedIndex].cartList[index].amount}개",
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            "Pretendard",
                                                                        fontSize:
                                                                            15,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: Color(
                                                                            0xffAFA08A),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            16),
                                                                    alignment:
                                                                        Alignment
                                                                            .centerRight,
                                                                    child: Text(
                                                                      "${provider.reservationList![provider.selectedIndex].cartList[index].salesPrice * provider.reservationList![provider.selectedIndex].cartList[index].amount}원",
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            "Pretendard",
                                                                        fontSize:
                                                                            15,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: Color(
                                                                            0xffAFA08A),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ]),
                                                          ),
                                                        ],
                                                      );
                                                    }),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 23),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16)),
                                                      backgroundColor:
                                                          Color(0xffEAE5DF),
                                                      fixedSize: Size(170, 62),
                                                      tapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                    ),
                                                    child: const Text(
                                                      '반려',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "Pretendard",
                                                        fontSize: 17,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xffAFA08A),
                                                      ),
                                                    ),
                                                    onPressed: () async {
                                                      await provider
                                                          .cancelReservation(
                                                              from: 'detail');

                                                      await Provider
                                                              .of<
                                                                      KakaoAlarmTalkProvider>(
                                                                  context,
                                                                  listen: false)
                                                          .cancelReservationAlarmFromDetail(
                                                              provider.reservationList![
                                                                  provider
                                                                      .selectedIndex],
                                                              provider
                                                                  .storeName,
                                                              provider.reservationRepNameList[
                                                                  provider
                                                                      .selectedIndex]);
                                                      Navigator
                                                          .pushNamedAndRemoveUntil(
                                                              context,
                                                              'main',
                                                              (route) => false);
                                                    }),
                                                ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16)),
                                                      backgroundColor:
                                                          Color(0xff855BF9),
                                                      fixedSize: Size(170, 62),
                                                      tapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                    ),
                                                    child: const Text(
                                                      '확정',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "Pretendard",
                                                        fontSize: 17,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xffF5F5F5),
                                                      ),
                                                    ),
                                                    onPressed: () async {
                                                      await provider
                                                          .confirmReservation();
                                                      provider.checkCartListAmountIsInit()
                                                          ? await Provider.of<KakaoAlarmTalkProvider>(context, listen: false).confirmReservationAlarm(
                                                              provider.reservationList![
                                                                  provider
                                                                      .selectedIndex],
                                                              provider
                                                                  .storeName,
                                                              provider.reservationRepNameList[
                                                                  provider
                                                                      .selectedIndex],
                                                              provider.getVisitTimeText(provider
                                                                  .reservationList![
                                                                      provider
                                                                          .selectedIndex]
                                                                  .visitTime))
                                                          : await Provider.of<KakaoAlarmTalkProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .partiallyConfirmReservationAlarm(
                                                                  provider.reservationList![provider.selectedIndex],
                                                                  provider.storeName,
                                                                  provider.reservationRepNameList[provider.selectedIndex],
                                                                  provider.getVisitTimeText(provider.reservationList![provider.selectedIndex].visitTime));
                                                      Navigator
                                                          .pushNamedAndRemoveUntil(
                                                              context,
                                                              'main',
                                                              (route) => false);
                                                    })
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        "예약 확인하기",
                        style: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: 17,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      )),
                  SizedBox(height: 29)
                ],
              );
            },

            ///
          ),
        ),
      ),
    );
  }
}
