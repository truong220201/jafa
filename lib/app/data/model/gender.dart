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

  int getGenderNumber() {
    switch (this) {
      case Gender.man:
        return 1;
      case Gender.woman:
        return 0;
      case Gender.other:
        return 3;
      default:
        return 0;
    }
  }
}

extension GenderListExtension on List<Gender> {
  List<String> getGenderTypes() =>
      map((gender) => gender.getGenderType()).toList();
}
