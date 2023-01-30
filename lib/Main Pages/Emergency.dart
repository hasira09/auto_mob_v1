import 'package:auto_mob_v1/front_end/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  @override
  Widget build(BuildContext context) {
    final num1 = '119';
    final num2 = '+94 112324984';
    final num3 = '+94 112431718';
    final num4 = '1959';
    final num5 ='+94 112691111';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Emergency",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: Image.asset("assets/icons/back.png"),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        elevation: 0.0,
      ),

      body:  Center(
        child: Column(
          // add an elevation
          children: [
            SizedBox(
              height: 25,
            ),
            Material(
              child: Container(
                //radius: 100,
                // onTap: () async {
                //   await FlutterPhoneDirectCaller.callNumber(num1);
                // },
                child: Image.asset('assets/images/police.png', width: 320,),

              ),
            ),
            SizedBox(
              height: 10,
            ),
            Material(
              child: InkWell(
                radius: 100,
                onTap: ()async {
                  await FlutterPhoneDirectCaller.callNumber(num1);
                },
                child: Image.asset('assets/images/119.png', width: 320,),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Material(
              child: InkWell(
                radius: 100,
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => (termsandcondition())));
                },
                child: Image.asset('assets/images/traffic.png', width: 320,),
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
                child: Image.asset('assets/images/t1.png', width: 320,),

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
                child: Image.asset('assets/images/t2.png', width: 320,),

              ),
            ),
            SizedBox(
              height: 10,
            ),
            Material(
              child: InkWell(
                radius: 100,
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => (termsandcondition())));
                },
                child: Image.asset('assets/images/t3.png', width: 320,),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Material(
              child: InkWell(
                radius: 100,
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => (termsandcondition())));
                },
                child: Image.asset('assets/images/acc.png', width: 320,),
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
                child: Image.asset('assets/images/acc1.png', width: 320,),

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
                child: Image.asset('assets/images/acc2.png', width: 320,),

              ),
            ),
          ],
        ),
      ),
    );
  }
}












