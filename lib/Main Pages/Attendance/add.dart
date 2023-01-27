import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class add extends StatefulWidget {
  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  TextEditingController route = TextEditingController();
  //TextEditingController div = TextEditingController();
  TextEditingController date = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Attendance'),
      ),
      body: Container(

        child: Column(

          children: [
            SizedBox(
              height: 20,
            ),
            SvgPicture.asset(
              "assets/icons/Attendance.svg",
              width: 200,
            ),
            SizedBox(
              height: 20,
            ),
            Container(

              //SizedBox(height: 60.0,),
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              child: TextFormField(
                //validator: validator,
                controller: route,
                //style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: 'Add Bus Route',
                    hintStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 2.0,
                        )
                    )
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              child: TextFormField(
                //validator: validator,
                controller: date,
                //style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: 'Add Date',
                    hintStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 2.0,
                        )
                    )
                ),
              ),

            ),
            SizedBox(
               height: 15,
             ),
            MaterialButton(
             // margin: EdgeInsets.all(20),
              height: 50,
              color: Color.fromARGB(255, 0, 0, 0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              onPressed: () {
                ref.add({
                  'bus route': route.text,
                  //'div': ww,
                  'date': date.text,
                });
              },
              child: Text(
                '          ADD          ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}