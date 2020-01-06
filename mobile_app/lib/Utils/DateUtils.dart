import 'package:intl/intl.dart';

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

  static String prepareDateToString(DateTime date){
    final format = DateFormat('dd/mm');
    return format.format(date);
  }
}
