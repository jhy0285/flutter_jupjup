import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_login/flutter_login.dart';
import 'package:jupjup/constants/enum/reservation_state.dart';
import 'package:jupjup/model/implement/cart_impl.dart';
import 'package:jupjup/model/implement/reservation_impl.dart';
import 'package:jupjup/viewmodel/impl/menu_provider_impl.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jupjup/model/implement/cart_impl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    MenuProvider providerRead =
        Provider.of<MenuProvider>(context, listen: false);
    providerRead.getStoreNameByStoreId();
    return FutureBuilder(
      future: providerRead.getReservationList(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: SpinKitFadingCircle(
                size: 100,
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.red : Colors.black87,
                    ),
                  );
                },
              ),
            ),
          );
        } else {
          return DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: Scaffold(
              body: SafeArea(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(
                            top: 46,
                            left: 16,
                          ),
                          child: Text(
                            "예약 상황",
                            style: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: 34,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff17181A)),
                          )),
                      SizedBox(height: 39),
                      Expanded(
                        child: Consumer<MenuProvider>(
                          builder: (context, provider, child) {
                            return Row(
                              children: [
                                SizedBox(width: 16),
                                Expanded(
                                  child: ListView.builder(
                                      itemCount:
                                          provider.reservationList!.length,
                                      itemBuilder: (BuildContext ctx, int idx) {
                                        return Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: provider
                                                            .reservationList![
                                                                idx]
                                                            .state ==
                                                        ReservationState.CANCEL
                                                    ? Color.fromRGBO(
                                                        234, 229, 223, 0.4)
                                                    : Color(0xffEAE5DF),
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                              ),
                                              height: 96,
                                              child: TextButton(
                                                style: TextButton.styleFrom(
                                                  tapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                ),
                                                onPressed: () {
                                                  provider
                                                      .setSelectedIndex(idx);
                                                  provider.reservationList![idx]
                                                              .state ==
                                                          ReservationState.NEW
                                                      ? Navigator.pushNamed(
                                                          context,
                                                          'detail',
                                                        )
                                                      : provider
                                                                  .reservationList![
                                                                      idx]
                                                                  .state ==
                                                              ReservationState
                                                                  .CONFIRM
                                                          ? Navigator.pushNamed(
                                                              context,
                                                              'confirm',
                                                            )
                                                          : Navigator.pushNamed(
                                                              context,
                                                              'completeAndCancel',
                                                            );
                                                },
                                                child: Stack(children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 16),
                                                    child: Text(
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xffAFA08A),
                                                      ),
                                                      provider.getReservationTimeText(
                                                          provider
                                                              .reservationList![
                                                                  idx]
                                                              .reserveId),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 250,
                                                    margin: EdgeInsets.only(
                                                        left: 16, top: 20),
                                                    child: Text(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      provider.reservationRepNameList[
                                                          idx],
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Pretendard",
                                                          fontSize: 22,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Color(
                                                              0xff17181A)),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 18.5, top: 54.5),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          color:
                                                              Color(0xffAFA08A),
                                                          Icons
                                                              .watch_later_outlined,
                                                          size: 15,
                                                        ),
                                                        SizedBox(width: 6.5),
                                                        Text(
                                                          provider.getVisitTimeText(
                                                              provider
                                                                  .reservationList![
                                                                      idx]
                                                                  .visitTime),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Pretendard",
                                                              fontSize: 15,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color(
                                                                  0xffAFA08A)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: provider
                                                                    .reservationList![
                                                                        idx]
                                                                    .state ==
                                                                ReservationState
                                                                    .NEW
                                                            ? Color.fromRGBO(
                                                                255,
                                                                189,
                                                                0,
                                                                0.8)
                                                            : provider
                                                                        .reservationList![
                                                                            idx]
                                                                        .state ==
                                                                    ReservationState
                                                                        .CONFIRM
                                                                ? Color(
                                                                    0xff855BF9)
                                                                : provider
                                                                            .reservationList![
                                                                                idx]
                                                                            .state ==
                                                                        ReservationState
                                                                            .COMPLETE
                                                                    ? Color(
                                                                        0xff56D578)
                                                                    : Color(
                                                                        0xffC8BCAB),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(14),
                                                      ),
                                                      width: 75,
                                                      height: 30,
                                                      margin: EdgeInsets.only(
                                                          right: 16, top: 20),
                                                      child: Center(
                                                        child: Text(
                                                          provider
                                                              .reservationList![
                                                                  idx]
                                                              .state
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "Pretendard",
                                                            fontSize: 15,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: provider
                                                                        .reservationList![
                                                                            idx]
                                                                        .state ==
                                                                    ReservationState
                                                                        .NEW
                                                                ? Color(
                                                                    0xff535353)
                                                                : provider
                                                                            .reservationList![
                                                                                idx]
                                                                            .state ==
                                                                        ReservationState
                                                                            .CONFIRM
                                                                    ? Colors
                                                                        .white
                                                                    : provider.reservationList![idx].state ==
                                                                            ReservationState
                                                                                .COMPLETE
                                                                        ? Color(
                                                                            0xff535353)
                                                                        : Color(
                                                                            0xffEAE5DF),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          right: 16, top: 58.5),
                                                      child: Text(
                                                        provider
                                                            .reservationList![
                                                                idx]
                                                            .customerName,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Pretendard",
                                                            fontSize: 15,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0xffAFA08A)),
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 16,
                                            )
                                          ],
                                        );
                                      }),
                                ),
                                SizedBox(width: 16),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: TabBar(
                onTap: (value) {
                  print(value);
                },
                indicator: TopIndicator(),
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.article_outlined)),
                  Tab(icon: Icon(Icons.settings_outlined)),
                ],
                unselectedLabelColor: Color(0xffC8BCAB), // 선택되지 않은 tab 색
                labelColor: Color(0xffE49318), // 선택된 tab의 색
              ),
            ),
          );
        }
      },
    );
  }
}

class TopIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TopIndicatorBox();
  }
}

class _TopIndicatorBox extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    Paint _paint = Paint()
      ..color = Color(0xffE49318)
      ..strokeWidth = 3
      ..isAntiAlias = true;

    canvas.drawLine(offset, Offset(cfg.size!.width + offset.dx, 0), _paint);
  }
}
