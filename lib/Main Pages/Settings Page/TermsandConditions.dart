import 'package:flutter/material.dart';

import 'Settings.dart';

class termsandcondition extends StatefulWidget {
  const termsandcondition({Key? key}) : super(key: key);

  @override
  State<termsandcondition> createState() => _termsandconditionState();
}

class _termsandconditionState extends State<termsandcondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Terms and Conditions",
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
              height: 0,
            ),
            Material(
              child: Container(
                child: Image.asset(
                  'assets/images/tr1.png',
                  width: 320,
                  height: 700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
