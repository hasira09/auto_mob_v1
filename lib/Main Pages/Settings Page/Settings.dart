import 'package:animations/animations.dart';
import 'package:auto_mob_v1/Main%20Pages/Settings%20Page/AboutUs.dart';
import 'package:auto_mob_v1/Main%20Pages/Settings%20Page/HelpandSupport.dart';
import 'package:auto_mob_v1/Main%20Pages/Settings%20Page/PrivacyPolicy.dart';
import 'package:auto_mob_v1/Main%20Pages/Settings%20Page/TermsandConditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"),),
      body: Center(
        child: Column(
          // add an elevation
          children: [
            SizedBox(
              height: 25,
            ),
              Material(
                child: InkWell(
                  radius: 100,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (help_support())));
                  },
                  child: Image.asset('assets/help_button.png', width: 380,),

                ),
              ),
            SizedBox(
              height: 10,
            ),
            Material(
              child: InkWell(
                radius: 100,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (privacy())));
                },
                child: Image.asset('assets/privacy_button.png', width: 380,),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Material(
              child: InkWell(
                radius: 100,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (termsandcondition())));
                },
                child: Image.asset('assets/terms_button.png', width: 380,),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Material(
              child: InkWell(
                radius: 100,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (aboutPage())));
                },
                child: Image.asset('assets/about_button.png', width: 380,),

              ),
            ),
            ],
          ),
      ),
    );
  }
}


