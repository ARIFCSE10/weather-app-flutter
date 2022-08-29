extension DateExtension on DateTime {
  static List<String> get weekdayNames => <String>[
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday',
      ];

  String get time => toIso8601String().split("T").last.split(".").first;
  String get weekdayName => weekdayNames[weekday - 1];
}
