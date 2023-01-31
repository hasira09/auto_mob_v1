import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'Settings.dart';

class help_support extends StatefulWidget {
  const help_support({Key? key}) : super(key: key);

  @override
  State<help_support> createState() => _help_supportState();
}

class _help_supportState extends State<help_support> {
  @override
  Widget build(BuildContext context) {
    final num2 = '+94 112100500';
    final num3 = '+94 711100500';
    final num4 = '+94 701082872';
    final num5 = '+94 710744814';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Help & Support",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: Image.asset("assets/icons/back.png"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsPage()));
          },
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Material(
              child: Container(
                child: Image.asset(
                  'assets/images/sltc.png',
                  width: 320,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Material(
              child: InkWell(
                radius: 100,
                onTap: () async {
                  await FlutterPhoneDirectCaller.callNumber(num2);
                },
                child: Image.asset(
                  'assets/images/s1.png',
                  width: 320,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Material(
              child: InkWell(
                radius: 100,
                onTap: () async {
                  await FlutterPhoneDirectCaller.callNumber(num3);
                },
                child: Image.asset(
                  'assets/images/s2.png',
                  width: 320,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Material(
              child: InkWell(
                radius: 100,
                onTap: () {},
                child: Image.asset(
                  'assets/images/s3.png',
                  width: 320,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Material(
              child: InkWell(
                radius: 100,
                onTap: () {},
                child: Image.asset(
                  'assets/images/auto.png',
                  width: 320,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Material(
              child: InkWell(
                radius: 100,
                onTap: () async {
                  await FlutterPhoneDirectCaller.callNumber(num4);
                },
                child: Image.asset(
                  'assets/images/a1.png',
                  width: 320,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Material(
              child: InkWell(
                radius: 100,
                onTap: () async {
                  await FlutterPhoneDirectCaller.callNumber(num5);
                },
                child: Image.asset(
                  'assets/images/a2.png',
                  width: 320,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
