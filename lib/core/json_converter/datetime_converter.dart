import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';


class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();
    static final _dateFormatter = DateFormat('yyyy-MM-dd hh:mm:ss');

  @override
  DateTime fromJson(String json) {
    return _dateFormatter.parse(json).toLocal();
  }

  @override
  String toJson(DateTime dateTime) {
    return _dateFormatter.format(dateTime);
  }
}


class DateConverter implements JsonConverter<DateTime, String> {
  const DateConverter();
    static final _dateFormatter = DateFormat('yyyy-MM-dd');

  @override
  DateTime fromJson(String json) {
    return _dateFormatter.parse(json).toLocal();
  }

  @override
  String toJson(DateTime dateTime) {
    return _dateFormatter.format(dateTime);
  }
}
