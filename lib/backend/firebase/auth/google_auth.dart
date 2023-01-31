import 'package:auto_mob_v1/global_users/enum_automob.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleAuthentication {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<GoogleSignInResult> signInWithGoogle() async {
    try {
      if (await this._googleSignIn.isSignedIn())
        return GoogleSignInResult.AlreadySignedIn;
      else {
        final GoogleSignInAccount? _googleSignInAccount =
            await this._googleSignIn.signIn();
        if (_googleSignInAccount == null)
          return GoogleSignInResult.SignInNotCompleted;
        else {
          final GoogleSignInAuthentication _googleSignInAuth =
              await _googleSignInAccount.authentication;
          final OAuthCredential _oAuthCredential =
              GoogleAuthProvider.credential(
            accessToken: _googleSignInAuth.accessToken,
            idToken: _googleSignInAuth.idToken,
          );
          final UserCredential userCredential = await FirebaseAuth.instance
              .signInWithCredential(_oAuthCredential);
          if (userCredential.user!.email != null) {
            print('Google Sign In Completed');
            return GoogleSignInResult.SignInCompleted;
          } else {
            print('Google Sign In Problem');
            return GoogleSignInResult.UnexpectedError;
          }
        }
      }
    } catch (e) {
      print('Error in Google Sign In ${e.toString()}');
      return GoogleSignInResult.UnexpectedError;
    }
  }

  Future<bool> logOut() async {
    try {
      print('Google Log Out');
      await _googleSignIn.disconnect();
      await _googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      print('Error in Google Log Out: ${e.toString()}');
      return false;
    }
  }
}
