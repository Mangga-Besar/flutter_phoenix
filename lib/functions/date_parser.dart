import 'package:intl/intl.dart';

class DateParser {
  static List<String> dayNames = [
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu",
    "Minggu"
  ];
  static List<String> monthNames = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  static String parse(DateTime dateTime) {
    var localDate = dateTime.toLocal();
    var dayName = dayNames[localDate.weekday - 1];
    var monthName = monthNames[localDate.month - 1];
    var formatter = NumberFormat("00");
    return "$dayName, ${localDate.day} $monthName ${localDate.year}, Pk. ${formatter.format(localDate.hour)}:${formatter.format(localDate.minute)}";
  }

  static String parseDate(DateTime dateTime) {
    var localDate = dateTime.toLocal();
    var dayName = dayNames[localDate.weekday - 1];
    var monthName = monthNames[localDate.month - 1];
    return "$dayName, ${localDate.day} $monthName ${localDate.year}";
  }

  static String parseDateOnly(DateTime dateTime) {
    var localDate = dateTime.toLocal();
    var monthName = monthNames[localDate.month - 1];
    return "${localDate.day} $monthName ${localDate.year}";
  }

  static String parseTime(DateTime dateTime) {
    var localDate = dateTime.toLocal();
    var formatter = NumberFormat("00");
    return "Pk. ${formatter.format(localDate.hour)}:${formatter.format(localDate.minute)}";
  }

  static String parseTimeOnly(DateTime dateTime) {
    var localDate = dateTime.toLocal();
    var formatter = NumberFormat("00");
    return "${formatter.format(localDate.hour)}:${formatter.format(localDate.minute)}";
  }
}
