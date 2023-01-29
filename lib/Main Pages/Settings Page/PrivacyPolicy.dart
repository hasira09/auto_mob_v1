import 'package:flutter/material.dart';

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
        title: Text(
          'Privacy Policy',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.blueGrey,
          iconSize: 30,
          onPressed: () {},
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Image.asset("Images/privacy.png",
                width: double.infinity, height: 100, fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '''Sri Lanka Technological Campus built the G Tracker app as a Free app. This SERVICE is provided by Sri Lanka Technological Campus at no cost and is intended for use as is.\n\n This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service. If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not providing and improving the Service. We wil not use or share your information with anyone except as described in this Privacy Policy.''',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,


            ),
          ),
          // Add additional text or widgets as needed
        ],
      ),
    );
  }
}
