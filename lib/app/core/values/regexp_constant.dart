class RegexpConstants {
  static RegExp date = RegExp(r'^\d{1,2}/\d{1,2}/\d{4}$');
  static RegExp dateDeny = RegExp(r'[^\d\/]');
  static RegExp otp = RegExp(r"^\d{6}$");
  static RegExp phoneNumber =
      RegExp(r"^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$");
}
