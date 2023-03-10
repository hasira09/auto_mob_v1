import 'package:auto_mob_v1/backend/firebase/auth/email_and_pwd_auth.dart';
import 'package:auto_mob_v1/backend/firebase/auth/google_auth.dart';
import 'package:auto_mob_v1/front_end/auth_ui/log_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../Main Pages/Attendance/mainpage.dart';
import '../Main Pages/Attendance/main_attendance_page.dart';

//import '../Main Pages/Settings Page/Attendance/Attendance.dart';
import '../Main Pages/Emergency.dart';
import '../Main Pages/Location/Location.dart';
import '../Main Pages/Payment.dart';
import '../Main Pages/Settings Page/Settings.dart';
import '../Main Pages/Profile/View Profile.dart';
import '../Main Pages/Attendance/add.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    final FirebaseAuth auth = FirebaseAuth.instance;

    var size = MediaQuery.of(context).size; //total height and width of device
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .30,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(64, 123, 255, 50),
                image: DecorationImage(image: AssetImage("assets/Lion.png"), fit: BoxFit.fitWidth)),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: MaterialButton(
                      onPressed: () async {
                        await auth.signOut();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LogInPage()));
                      },
                      child: InkWell(
                        radius: 100,
                        child: Image.asset(
                          'assets/Logout.png',
                          width: 40,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "WELCOME TO \nAUTOMOB",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  Expanded(
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LocationPage()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(0, 0, 128, 0.1),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Location.svg",
                                  height: 150,
                                ),
                                Text(
                                  "Location",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(0, 0, 128, 0.1),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Attendance.svg",
                                  height: 150,
                                ),
                                Text(
                                  "Attendace",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ViewProfilePage()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(0, 0, 128, 0.1),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/View Profile.svg",
                                  height: 150,
                                ),
                                Text(
                                  "View Profile",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const payment()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(0, 0, 128, 0.1),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Payment.svg",
                                  height: 150,
                                ),
                                Text(
                                  "Payment",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EmergencyPage()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(0, 0, 128, 0.1),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Emergency.svg",
                                  height: 150,
                                ),
                                Text(
                                  "Emergency",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SettingsPage()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(0, 0, 128, 0.1),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Settings.svg",
                                  height: 150,
                                ),
                                Text(
                                  "Settings",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
