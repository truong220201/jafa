import '../values/regexp_constant.dart';

extension StringX on String {
  bool get isFormatDate {
    return RegexpConstants.date.hasMatch(this);
  }
}
