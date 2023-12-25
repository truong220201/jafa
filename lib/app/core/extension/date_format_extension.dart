import 'package:intl/intl.dart';

import '../values/string_constants.dart';

extension DateFormatX on DateTime {
  //dd/MM/yyyy
  String toFormattedDate() {
    return DateFormat(StringConstants.dateFormat).format(this);
  }

  //dd-MM-yyyy
  String toFormattedDate2() {
    return DateFormat(StringConstants.dateFormat2).format(this);
  }

  //MM/dd/yyyy
  String toFormattedDate3() {
    return DateFormat(StringConstants.dateFormat3).format(this);
  }
}
