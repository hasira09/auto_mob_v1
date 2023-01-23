import 'package:auto_mob_v1/backend/firebase/auth/email_and_pwd_auth.dart';
import 'package:auto_mob_v1/backend/firebase/auth/google_auth.dart';
import 'package:auto_mob_v1/front_end/auth_ui/log_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmailAndPasswardAuth _emailAndPasswardAuth = EmailAndPasswardAuth();
  final GoogleAuthentication _googleAuthentication = GoogleAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
          child: Text('Log out'),
          onPressed: ()async{
            final bool response = await this._googleAuthentication.logOut();

            if(response) {
            await this._emailAndPasswardAuth.logOut();
            }
              Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(builder: (_) => LogInPage()), (
                  route) => false);

          },
        ),
      ),
    );
  }
}
