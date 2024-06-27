import 'package:get_time_ago/get_time_ago.dart';
import 'package:intl/intl.dart';

void main() {
  var date = DateTime.now();
  String a = "2024-06-27 18:40:02.761372";
  DateTime b = DateTime.parse(a);
  print(GetTimeAgo.parse(b, locale: "ru"));
  print(DateFormat.Hms().format(date));
}
