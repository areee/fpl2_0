import 'package:fpl2_0/extensions/string_extension.dart';

import '../static.dart';

/// Returns the text for the app bar
String getAppBarText() {
  var adjective = getAdjective();
  var weekDay = getWeekDay(DateTime.now().weekday - 1);
  return '${adjective.toCapitalized()} $weekDay';
}
