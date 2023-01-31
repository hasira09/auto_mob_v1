import 'package:auto_mob_v1/backend/firebase/auth/email_and_pwd_auth.dart';
import 'package:auto_mob_v1/front_end/auth_ui/common_auth_methods.dart';
import 'package:auto_mob_v1/front_end/home_page.dart';
import 'package:auto_mob_v1/global_users/enum_automob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../backend/firebase/auth/google_auth.dart';
import '../../global_users/reg_exp.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final GlobalKey<FormState> _logInKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _pwd = TextEditingController();

  final EmailAndPasswardAuth _emailAndPasswardAuth = EmailAndPasswardAuth();
  final GoogleAuthentication _googleAuthentication = GoogleAuthentication();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: LoadingOverlay(
        isLoading: this._isLoading,
        child: Container(
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 60.0,
              ),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: 200,
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 40.0),
                child: Form(
                  key: this._logInKey,
                  child: ListView(
                    children: [
                      commonTextFormField(
                          hintText: 'Email',
                          validator: (inputVal) {
                            if (!emailRegex.hasMatch(inputVal.toString()))
                              return "Email is not matching";
                            return null;
                          },
                          textEditingController: this._email),
                      commonTextFormField(
                          hintText: 'Passward',
                          validator: (inputVal) {
                            if (inputVal!.length < 6)
                              return "Passward must be atleast 6 characters";
                            return null;
                          },
                          textEditingController: this._pwd),
                      logInAuthButton(context, 'LOG-IN'),
                      logInSocialMediaIntegrationButtons(),
                      SizedBox(
                        height: 30.0,
                      ),
                      switchToAnotherPage(
                          context, 'Dont have an account? ', 'Sign-up'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget logInAuthButton(BuildContext context, String buttonName) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.of(context).size.width - 30, 60.0),
            elevation: 5.0,
            primary: Color.fromARGB(255, 0, 0, 0),
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 7.0,
              bottom: 7.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            )),
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 20.0,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        onPressed: () async {
          if (this._logInKey.currentState!.validate()) {
            print("Validated");
            SystemChannels.textInput.invokeMethod('TextInput.hide');

            if (mounted) {
              setState(() {
                this._isLoading = true;
              });
            }

            final EmailSignInResult emailSignInResult =
                await _emailAndPasswardAuth.signInWithEmailAndPassward(
                    email: this._email.text, pwd: this._pwd.text);
            String msg = '';
            if (emailSignInResult == EmailSignInResult.SignInCompleted)
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => HomePage()),
                  (route) => false);
            else if (emailSignInResult == EmailSignInResult.EmailNotVerified) {
              msg = 'Email not verified.\n Please verify your account';
            } else if (emailSignInResult ==
                EmailSignInResult.EmailorPasswardInvalid)
              msg = 'Email And Passward Invalid';
            else
              msg = 'Sign In Not Completed';

            if (msg != '')
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(msg)));

            if (mounted) {
              setState(() {
                this._isLoading = false;
              });
            }
          } else {
            print("Not Validated");
          }
        },
      ),
    );
  }

  Widget logInSocialMediaIntegrationButtons() {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
      child: Column(
        children: [
          Image.asset(
            'assets/line.png',
            width: 350,
          ),
          GestureDetector(
            onTap: () async {
              print('Google Pressed');

              if (mounted) {
                setState(() {
                  this._isLoading = true;
                });
              }

              final GoogleSignInResult _googleSignInResult =
                  await this._googleAuthentication.signInWithGoogle();
              String msg = '';

              if (_googleSignInResult == GoogleSignInResult.SignInCompleted) {
                msg = 'Sign In Completed';
              } else if (_googleSignInResult ==
                  GoogleSignInResult.SignInNotCompleted)
                msg = 'Sign In Not Completed';
              else if (_googleSignInResult ==
                  GoogleSignInResult.AlreadySignedIn)
                msg = 'Already Signed In';
              else
                msg = 'Unexpected Error Happen';

              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(msg)));

              if (_googleSignInResult == GoogleSignInResult.SignInCompleted)
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => HomePage()),
                    (route) => false);

              if (mounted) {
                setState(() {
                  this._isLoading = false;
                });
              }
            },
            child: Image.asset(
              'assets/google.png',
              width: 450,
            ),
          ),
        ],
      ),
    );
  }
}
