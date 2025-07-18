import 'package:intl/intl.dart';

String formatDateTime(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(Duration(days: 1));
  final dateToCompare = DateTime(date.year, date.month, date.day);
  final time = DateFormat('HH:mm').format(date);

  if (dateToCompare == today) {
    return 'Bugun $time';
  } else if (dateToCompare == yesterday) {
    return 'Kecha $time';
  } else {
    final dayMonth = DateFormat('d MMMM', 'uz').format(date);
    return '$dayMonth $time';
  }
}
