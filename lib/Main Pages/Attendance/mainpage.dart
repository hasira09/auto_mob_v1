import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//meke ghnna card view eka


class mainpage extends StatefulWidget {
  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('All Attendance'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            //const Text("\nProducts"),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("attendance").snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if(snapshot.hasData) {
                  final snap = snapshot.data!.docs;
                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snap.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 70,
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
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 70),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                //snap[index]['date'],
                                snap[index]['date'],
                                style: const TextStyle(
                                  color: Colors.green,
                                 // color: Colors.green.withOpacity(0.7),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 120),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                //snap[index]['date'],
                                snap[index]['time'],
                                style: const TextStyle(
                                  color: Colors.green,
                                  // color: Colors.green.withOpacity(0.7),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 30),
                              alignment: Alignment.centerRight,
                              child: Text(
                                snap[index]['bus route'],
                                style: TextStyle(
                                 color: Colors.black,),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 60),
                              alignment: Alignment.center,
                              child: Text(
                                snap[index]['index'],
                                style: TextStyle(
                                  color: Colors.black,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Image.asset('assets/Check.png', width: 40,),
                                ],
                              ),
                            ),
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



