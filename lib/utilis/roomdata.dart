class RoomData {
  int numberRoom;
  int children;
  int adult;

  RoomData({required this.numberRoom, required this.adult, required this.children});
}

class DateText {
  late int startDate;
  late int endDate;

  DateText(this.startDate, this.endDate);
}

class PeopleSleeps {
  int peopleNumber;
  PeopleSleeps(this.peopleNumber);
}