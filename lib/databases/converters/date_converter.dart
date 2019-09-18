
class DateConverter{

  static DateTime toDate(int timestamp){
    return timestamp == null ? null: DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  static int toTimeStamp(DateTime dateTime){
    return dateTime == null ? null: dateTime.millisecondsSinceEpoch;
  }

}