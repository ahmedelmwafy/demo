// ignore_for_file: unnecessary_null_comparison

DateTime? parseDateTime(String dateTimeString) {
  if (dateTimeString == null) {
    return null;
  } else {
    return DateTime.parse(dateTimeString);
  }
}
