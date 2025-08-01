class CalendarData {
  static const List<String> containerTitles = [
    '', // Empty title for Container 1
    'Aliran Menstruasi',
    'Suasana Hati',
    'Gejala',
  ];

  static List<Map<String, String>> getWeekData() {
    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    List<Map<String, String>> weekData = [];

    for (int i = 0; i < 7; i++) {
      DateTime day = startOfWeek.add(Duration(days: i));
      String dayInitial = _getDayInitial(day.weekday);
      String date = day.day.toString();
      weekData.add({'initial': dayInitial, 'date': date});
    }

    return weekData;
  }

  static String _getDayInitial(int weekday) {
    switch (weekday) {
      case 1:
        return 'M';
      case 2:
        return 'T';
      case 3:
        return 'W';
      case 4:
        return 'T';
      case 5:
        return 'F';
      case 6:
        return 'S';
      case 7:
        return 'S';
      default:
        return '';
    }
  }
}
