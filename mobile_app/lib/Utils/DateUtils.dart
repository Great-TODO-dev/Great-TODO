class DateUtils {
  DateUtils();

  static bool isToday(DateTime date) {
    DateTime today = DateTime.now();
    if (date?.day == today.day &&
        date?.month == today.month &&
        date?.year == today.year) {
      return true;
    }
    return false;
  }
}
