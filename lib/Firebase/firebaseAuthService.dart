import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth _fireAuth = FirebaseAuth.instance;
  String verifyId = '';

  Future sendOtp({
    required String phone,
    required Function errorStep,
    required Function nextStep,
  }) async {
    await _fireAuth
        .verifyPhoneNumber(
      timeout: Duration(seconds: 120),
      phoneNumber: '+233551234567',
      verificationCompleted: (PhoneAuthCredential) {
        return;
      },
      verificationFailed: (error) {
        return;
      },
      codeSent: (verificationId, forceResendingToken) {
        verifyId = verificationId;
        print('code Sent');
        nextStep();
      },
      codeAutoRetrievalTimeout: (verificationId) {
        return;
      },
    )
        .onError((error, stackTrace) {
      errorStep();
    });
  }

  // verify otp and login

  Future loginWithOtp({required String otp}) async {
    print(verifyId);
    final _cred =
        PhoneAuthProvider.credential(verificationId: verifyId, smsCode: otp);
    // final _timeOutDuration = Duration(seconds: 30);
    try {
      final user = await _fireAuth.signInWithCredential(_cred);
      if (user.user != null) {
        return "success";
      } else {
        return "Error in Otp login";
      }
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }

  Future<bool> isLoggedIn() async {
    User? user = _fireAuth.currentUser;
    return user != null;
  }
}
