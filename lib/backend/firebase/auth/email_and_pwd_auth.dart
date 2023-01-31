import 'package:auto_mob_v1/global_users/enum_automob.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailAndPasswardAuth {
  Future<EmailSignUpResults> signUpAuth(
      {required String email, required String pwd}) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pwd);
      if (userCredential.user!.email != null) {
        await userCredential.user!.sendEmailVerification();
        return EmailSignUpResults.SignUpCompleted;
      }
      return EmailSignUpResults.SignUpNotCompleted;
    } catch (e) {
      print('Error in Email and Passward Sign Up: ${e.toString()}');
      return EmailSignUpResults.EmailAlreadyPresent;
    }
  }

  Future<EmailSignInResult> signInWithEmailAndPassward(
      {required String email, required String pwd}) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pwd);
      if (userCredential.user!.emailVerified)
        return EmailSignInResult.SignInCompleted;
      else {
        final bool logOutResponse = await logOut();
        if (logOutResponse) return EmailSignInResult.EmailNotVerified;
        return EmailSignInResult.UnexpectedError;
      }
    } catch (e) {
      print(
          'Error in Sign In with Email And Passward Authentication: ${e.toString()}');
      return EmailSignInResult.EmailorPasswardInvalid;
    }
  }

  Future<bool> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
