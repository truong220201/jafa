import 'package:intl/intl.dart';
import '../../data/model/gender.dart';
import '../values/regexp_constant.dart';

extension StringX on String {
  bool get isFormatDate {
    return RegexpConstants.date.hasMatch(this);
  }

  DateTime toFormatDate() {
    return DateFormat('dd/MM/yyyy').parse(this);
  }

  DateTime toFormatDate2() {
    return DateFormat('MM/dd/yyyy').parse(this);
  }

  Gender getGender() {
    switch (this) {
      case "Nam":
        return Gender.man;
      case "Nữ":
        return Gender.woman;
      case "Khác":
        return Gender.other;
      default:
        return Gender.man;
    }
  }
}
