enum ReservationState {
  NEW("신규"),
  CANCEL("취소"),
  CONFIRM("확정"),
  COMPLETE("완료");

  final String desc;
  const ReservationState(this.desc); // 이넘생성자 blabla("desc") 꼴임

//String -> enum
  factory ReservationState.fromString(String str) {
    return ReservationState.values
        .firstWhere((element) => element.toString() == str);
  }
  //print() 하거나 toString 하면 desc리턴
  @override
  String toString() {
    return desc;
  }
}
