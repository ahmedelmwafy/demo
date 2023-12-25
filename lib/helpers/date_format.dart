// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';

String formatDateString(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  final formatter = DateFormat('yyyy-MM-dd ');
  String formattedDate = formatter.format(dateTime);

  return formattedDate;
}
