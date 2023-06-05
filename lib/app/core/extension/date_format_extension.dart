import 'package:intl/intl.dart';

import '../values/string_constants.dart';

extension DateFormatX on DateTime {
  String toFormattedDate() {
    return DateFormat(StringConstants.dateFormat).format(this);
  }
}
