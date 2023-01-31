import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'main_attendance_page.dart';

class add extends StatefulWidget {
  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  TextEditingController route = TextEditingController();
  TextEditingController index = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('attendance');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Add Attendance",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: Image.asset("assets/icons/back.png"),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SvgPicture.asset(
                "assets/icons/Attendance.svg",
                width: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                child: TextFormField(
                  controller: index,
                  decoration: InputDecoration(
                      hintText: 'Add your index number',
                      hintStyle: TextStyle(color: Colors.black45),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.black26,
                        width: 2.0,
                      ))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                child: TextFormField(
                  controller: date,
                  decoration: InputDecoration(
                      hintText: 'Add date "03/10"',
                      hintStyle: TextStyle(color: Colors.black45),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.black26,
                        width: 2.0,
                      ))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                child: TextFormField(
                  controller: time,
                  decoration: InputDecoration(
                      hintText: 'Add time "00.00"',
                      hintStyle: TextStyle(color: Colors.black45),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.black26,
                        width: 2.0,
                      ))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                child: TextFormField(
                  controller: route,
                  decoration: InputDecoration(
                      hintText: 'Add bus route',
                      hintStyle: TextStyle(color: Colors.black45),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.black26,
                        width: 2.0,
                      ))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                height: 40,
                color: Color.fromARGB(255, 0, 0, 0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                onPressed: () {
                  ref.add({
                    'bus route': route.text,
                    'index': index.text,
                    'date': date.text,
                    'time': time.text,
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
      ),
    );
  }
}
