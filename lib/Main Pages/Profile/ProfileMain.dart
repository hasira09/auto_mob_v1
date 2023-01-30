import 'package:auto_mob_v1/Main%20Pages/Profile/ProfileData.dart';
import 'package:auto_mob_v1/Main%20Pages/Profile/View%20Profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Information'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            //const Text("\nProducts"),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("profile").snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if(snapshot.hasData) {
                  final snap = snapshot.data!.docs;
                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snap.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 600,
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              //offset: Offset(1, 1),
                              blurRadius: 5,
                            ),
                          ],
                        ),


                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),

                            Image.asset(
                              "assets/profile.png",
                              width: 180,
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 0),
                              alignment: Alignment.center,
                              child: Text(
                                //snap[index]['date'],
                                "\Name: ${snap[index]['name']}",
                                // snap[index]['name'],
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  // color: Colors.green.withOpacity(0.7),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),


                            Container(
                              margin: const EdgeInsets.only(bottom: 0),
                              alignment: Alignment.center,
                              child: Text(
                                //snap[index]['date'],
                                "\Email: ${snap[index]['email']}",
                                //snap[index]['email'],
                                style: const TextStyle(
                                  color: Colors.black,
                                  // color: Colors.green.withOpacity(0.7),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),


                            Container(
                              margin: const EdgeInsets.only(bottom:0) ,
                              alignment: Alignment.center,
                              child: Text(
                                //snap[index]['index'],
                                "\Index: ${snap[index]['index']}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),

                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            Container(
                              margin: const EdgeInsets.only(bottom: 0),
                              alignment: Alignment.center,
                              child: Text(
                                // snap[index]['batch'],
                                "\Batch: ${snap[index]['batch']}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            //       // Container(
                            //       //   margin: const EdgeInsets.only(left: 20),
                            //       //   alignment: Alignment.centerLeft,
                            //       //   child: Row(
                            //       //     children: [
                            //       //       Image.asset('assets/Check.png', width: 40,),
                            //       //     ],
                            //       //   ),
                            //       // ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
