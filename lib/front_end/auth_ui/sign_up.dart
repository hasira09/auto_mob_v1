import 'package:auto_mob_v1/backend/firebase/auth/email_and_pwd_auth.dart';
import 'package:auto_mob_v1/backend/firebase/auth/google_auth.dart';
import 'package:auto_mob_v1/front_end/auth_ui/log_in.dart';
import 'package:auto_mob_v1/global_users/enum_automob.dart';
import 'package:auto_mob_v1/global_users/reg_exp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../home_page.dart';
import 'common_auth_methods.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _pwd = TextEditingController();
  final TextEditingController _confirmPwd = TextEditingController();
  final EmailAndPasswardAuth _emailAndPasswardAuth = EmailAndPasswardAuth();
  final GoogleAuthentication _googleAuthentication = GoogleAuthentication();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context){
    return SafeArea(child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: LoadingOverlay(
          isLoading: this._isLoading,
          child: Container(
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(height: 60.0,),
                Center(
                  child: Column(
                    children: [
                      Image.asset('assets/logo.png', width: 200,),
                    ],
                  ),
                 // child: Text('SignUp',style: TextStyle(fontSize: 20.0,color: Colors.black),),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/1,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 30.0),
                  child: Form(
                    key: this._signUpKey,
                    child: ListView(
                      children: [
                        commonTextFormField(hintText:'Email', validator: (inputVal){
                          if(!emailRegex.hasMatch(inputVal.toString()))
                            return "Email fomat not matching";
                          return null;
                        },textEditingController: this._email),
                        commonTextFormField(hintText:'Passward', validator: (inputVal){
                          if(inputVal!.length <6)
                            return "Passward must be atleast 6 characters";
                          return null;
                        },textEditingController: this._pwd),
                        commonTextFormField(hintText:'Confirm Passward', validator: (inputVal){
                          if(inputVal!.length <6)
                            return " Confirm Passward must be atleast 6 characters";
                          if(this._pwd.text != this._confirmPwd.text)
                            return 'Passward and Confirm Passward not Same';
                          return null;
                        },textEditingController: this._confirmPwd),
                        signUpAuthButton(context,'SIGN-UP'),
                        signUpSocialMediaIntegrationButtons(),
                        switchToAnotherPage(context,'Already have an account? ','Log-in'),
                        // SizedBox(height: 100.0,),
                        // Center(
                        //   child: Column(
                        //     children: [
                        //       Image.asset('assets/uni_logo.png', width: 250,),
                        //     ],
                        //   ),
                        //   // child: Text('SignUp',style: TextStyle(fontSize: 20.0,color: Colors.black),),
                        // ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 100.0,),
                // Center(
                //   child: Text('or Continue with', style: TextStyle(color: Colors.black26 ),),
                // ),

              ],
            ),
          ),
        ),
      ),
    ),
    );
  }

 Widget signUpAuthButton(BuildContext context, String buttonName) {
   return Padding(
     padding: const EdgeInsets.only(left: 20.0,right: 20.0, top:30.0),
     child: ElevatedButton(
       style: ElevatedButton.styleFrom(
           minimumSize: Size(
               MediaQuery.of(context).size.width - 30, 60.0),
           elevation: 5.0,
           primary: Color.fromARGB(255, 0, 0, 0),
           padding: EdgeInsets.only(
             left: 20.0,
             right: 20.0,
             top: 7.0,
             bottom: 7.0,
           ),
           shape:  RoundedRectangleBorder(
             borderRadius:
             BorderRadius.all(Radius.circular(10.0)),
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
         if(this._signUpKey.currentState!.validate()){
           print("Validated");
           if(mounted){
             setState(() {
               this._isLoading = true;
             });
           }

           SystemChannels.textInput.invokeMethod('TextInput.hide');
           final EmailSignUpResults response = await this._emailAndPasswardAuth.signUpAuth(email: this._email.text, pwd: this._pwd.text);

           if(response == EmailSignUpResults.SignUpCompleted){
             Navigator.push(context, MaterialPageRoute(builder: (_) => LogInPage()));
           }else{
             final String msg = response == EmailSignUpResults.EmailAlreadyPresent?'Email Already Present':'SignUp Not Completed';
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

           }
         }else{
           print("Not Validated");
         }
         if(mounted){
           setState(() {
             this._isLoading = false;
           });
         }
       },
     ),
   );
 }


  Widget signUpSocialMediaIntegrationButtons() {
    return Container(
      //width: double.maxFinite,
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
      child: Column(
        children: [
          Image.asset('assets/line.png', width: 350,),
          //SizedBox(height: 50.0,),
          GestureDetector(
            onTap: ()async{
              print('Google Pressed');
              if(mounted){
                setState(() {
                  this._isLoading = true;
                });
              }

              final GoogleSignInResult _googleSignInResult =await this._googleAuthentication.signInWithGoogle();
              String msg = '';

              if(_googleSignInResult == GoogleSignInResult.SignInCompleted) {
                msg = 'Sign In Completed';
                //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => HomePage()) ,(route) => false);
              }else if(_googleSignInResult == GoogleSignInResult.SignInNotCompleted)
                msg = 'Sign In Not Completed';
              else if(_googleSignInResult == GoogleSignInResult.AlreadySignedIn)
                msg = 'Already Signed In';
              else
                msg = 'Unexpected Error Happen';

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

              if(_googleSignInResult == GoogleSignInResult.SignInCompleted)
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => HomePage()) ,(route) => false);


              if(mounted){
                setState(() {
                  this._isLoading = false;
                });
              }

            },
            child:Image.asset('assets/google.png', width: 450,),
          ),
        ],
      ),
    );
  }


}




