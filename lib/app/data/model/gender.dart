import '../../core/values/string_constants.dart';

enum Gender {
  man,
  woman,
  other,
}

extension GenderExtension on Gender {
  String getGenderType() {
    switch (this) {
      case Gender.man:
        return StringConstants.man;
      case Gender.woman:
        return StringConstants.woman;
      case Gender.other:
        return StringConstants.other;
      default:
        return '';
    }
  }
}

extension GenderListExtension on List<Gender> {
  List<String> getGenderTypes() =>
      map((gender) => gender.getGenderType()).toList();
}
