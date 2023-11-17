import 'package:intl/intl.dart';

/// Returns the month as a Double
double getMonth(DateTime date) {
  return double.parse(DateFormat.M().format(date));
}

/// Returns the day as a double
double getDay(DateTime date) {
  return double.parse(DateFormat.d().format(date));
}

/// Add month and date together for a point on the chart
/// Divide by 32 so I can never get 1 result on a month with 31 days
double datePoint(DateTime date) {
  return getMonth(date) + (getDay(date) / 32);
}
