import 'package:flutter/material.dart';

import 'Settings.dart';

class privacy extends StatefulWidget {
  const privacy({Key? key}) : super(key: key);

  @override
  State<privacy> createState() => _privacyState();
}

class _privacyState extends State<privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Privacy Policy",
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
              height: 17,
            ),
            Material(
              child: Container(
                child: Image.asset(
                  'assets/images/pr1.png',
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
