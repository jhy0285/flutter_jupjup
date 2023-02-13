import 'package:flutter/foundation.dart';
import 'package:jupjup/model/implement/reservation_impl.dart';
import 'package:jupjup/repo/firebase_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRepo implements IFirebaseRepo {
  FirebaseFirestore db = FirebaseFirestore.instance;
  static int storeId = -1;
  static String storeName = "";

  @override
  Future<String> getStoreNameByStoreId() async {
    int? result;
    QuerySnapshot res =
        await db.collection("Store").where("storeId", isEqualTo: storeId).get();
    if (res.docs.isEmpty) {
      result = null;
    } else {
      storeName = res.docs[0]["name"];
    }
    return storeName;
  }

  @override
  Future<int?> getStoreIdByAdmin(id, password) async {
    int? result;
    QuerySnapshot res = await db
        .collection("admin")
        .where("id", isEqualTo: id)
        .where("password", isEqualTo: password)
        .get();
    if (res.docs.isEmpty) {
      print(123123);
      result = null;
    } else {
      result = res.docs[0]["storeId"];
      storeId = result!;
    }
    return storeId;
  }

  @override
  Future<List<Reservation>?> getReservationListByStoreId() async {
    QuerySnapshot res = await db
        .collection("Reservation")
        .where("storeId", isEqualTo: storeId)
        .get();
    if (res.docs.isEmpty) {
      return null;
    } else {
      return res.docs
          .map((doc) => Reservation.fromFirebase(doc))
          .cast<Reservation>()
          .toList()
          .reversed
          .toList();
    }
  }

  @override
  Future<void> updateReservation(Reservation reservation) async {
    await db
        .collection("Reservation")
        .doc(reservation.reserveId.toString())
        .set(reservation.toFireBase(reservation))
        .onError((e, _) => debugPrint("Error up document: $e"));
  }

  // @override
  // List<dynamic> getStreamAndSetReservationList() {
  //   late List<Reservation> reservationList;

  //   Stream<QuerySnapshot> stream = db
  //       .collection('Reservation')
  //       .where("storeId", isEqualTo: storeId)
  //       .snapshots();

  //   stream.listen((res) {
  //     reservationList = res.docs
  //         .map((doc) {
  //           print(9999999);
  //           Reservation.fromFirebase(doc);
  //         })
  //         .cast<Reservation>()
  //         .toList();
  //   });
  //   // print(res)
  //   print(312333);
  //   return [stream, reservationList];
  // }
}
