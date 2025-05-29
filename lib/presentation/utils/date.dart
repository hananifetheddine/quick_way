import 'package:intl/intl.dart';

DateTime? dateJsonNull(String? json) {
  if (json == null) {
    return null;
  }
  return DateTime.parse(json);
}

extension ToString on DateTime {
  String toStringFormat() {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(this);
    return formatted.toString();
  }

  String toStringHM() {
    DateFormat formatter = DateFormat('h:mm a');
    String formattedTime = formatter.format(this);
    return formattedTime;
  }

  String toStringDMYHM() {
    DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
    final String formatted = formatter.format(this);
    return formatted.toString();
  }

  String toStringDMHM() {
    DateFormat formatter = DateFormat('dd MMMM hh:mm');
    final String formatted = formatter.format(this);
    return formatted.toString();
  }

  String toStringDM() {
    DateFormat formatter = DateFormat('dd MMMM');
    final String formatted = formatter.format(this);
    return formatted.toString();
  }

  String toStringDMY() {
    DateFormat formatter = DateFormat('dd MMMM yyyy');
    final String formatted = formatter.format(this);
    return formatted.toString();
  }

  String currentHourString() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
}

DateTime parseTime(String time, DateTime referenceDate) {
  List<String> parts = time.split(':');
  int hour = int.parse(parts[0]);
  int minute = int.parse(parts[1]);
  return DateTime(
      referenceDate.year, referenceDate.month, referenceDate.day, hour, minute);
}
