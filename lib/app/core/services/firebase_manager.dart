import 'package:firebase_auth/firebase_auth.dart';

class FirebaseManager {
  static Future<void> verifyPhoneNumber(
      String phone, void Function(String, int?) codeSent) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: codeSent,
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

}
