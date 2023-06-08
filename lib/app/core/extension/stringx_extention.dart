import 'package:intl/intl.dart';

import '../values/regexp_constant.dart';

extension StringX on String {
  bool get isFormatDate {
    return RegexpConstants.date.hasMatch(this);
  }

  DateTime toFormatDate() {
    return DateFormat('dd/MM/yyyy').parse(this);
  }
}
