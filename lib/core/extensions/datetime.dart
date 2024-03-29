extension DateTimeExtensions on DateTime {
  String toJsonDateString() {
    return '$year-$monthStr-$dayStr';
  }

  String get monthStr => month.toString().padLeft(2, '0');

  String get dayStr => day.toString().padLeft(2, '0');

  String toDateString() {
    return '$year/$monthStr/$dayStr (${weekdayJpString()})';
  }

  String weekdayJpString() {
    switch (weekday) {
      case DateTime.monday:
        return '月';
      case DateTime.tuesday:
        return '火';
      case DateTime.wednesday:
        return '水';
      case DateTime.thursday:
        return '木';
      case DateTime.friday:
        return '金';
      case DateTime.saturday:
        return '土';
      case DateTime.sunday:
        return '日';
      default:
        return '';
    }
  }
}
