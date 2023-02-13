import 'package:jupjup/model/implement/reservation_impl.dart';

abstract class IFirebaseRepo {
  Future<int?> getStoreIdByAdmin(String id, String password);
  Future<List<Reservation>?> getReservationListByStoreId();
  Future<void> updateReservation(Reservation reservation);
}
