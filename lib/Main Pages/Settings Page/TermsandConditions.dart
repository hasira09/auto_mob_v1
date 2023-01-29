import 'package:flutter/material.dart';


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
          title: const Text("Terms & Conditions"),
          backgroundColor: Colors.white,
          centerTitle: true,
          foregroundColor: Colors.black,

        ),
        body: Column(
            children: <Widget>[
              Expanded(
                child: Image.asset("assets/terms.png",width: double.infinity, height: 100, fit: BoxFit.cover),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  ''' 
By downloading or using the app, these terms will automatically apply to you - you should make sure therefore that you read them carefully before using the app. You're not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. 
 
You're not allowed to attempt to extract the source code of the app, and you also shouldn't try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to Sri Lanka Technological Campus. 
''',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),

                ),

              ),
            ]
        )
    ) ;
  }
}
