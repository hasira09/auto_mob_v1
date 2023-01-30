
import 'package:auto_mob_v1/Main%20Pages/Profile/ProfileData.dart';
import 'package:auto_mob_v1/Main%20Pages/Profile/View%20Profile.dart';
import 'package:auto_mob_v1/front_end/auth_ui/log_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter/material.dart';


//final usersRef = FirebaseFirestore.instance.collection('users');

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // void initState() {
  //   // TODO: implement initState
  //   getUsersById();
  //   super.initState();
  // }

  // getUsersById(){
  //   final String id = "HeLzGc9WiXFvA3Ubyta7";
  //   usersRef.doc(id).get().then((DocumentSnapshot doc){
  //   });
  // }

  // getUsers(){
  //   usersRef.getDocuments().then((QuerySnapshot snapshot) {
  //     snapshot.documents.forEach((DocumentSnapshot doc) {
  //       print(doc.data);
  //       print(doc.documentID);
  //       print(doc.exists);
  //     });
  //   });
  // }

  @override

  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;

    CollectionReference database =
    FirebaseFirestore.instance.collection('Data');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
<<<<<<< Updated upstream
        backgroundColor: Colors.white,
        title: const Text(
          "Profile Information",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: Image.asset("assets/icons/back.png"),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ViewProfilePage()));
          },
        ),
        elevation: 0.0,
      ),

=======
        title: const Text('Profile Information'),
        actions: <Widget>[
          IconButton (
            icon: const Icon(Icons.logout),
            onPressed: () async{
              await auth.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (_) => LogInPage()));
            },
          ),
        ],

      ),


>>>>>>> Stashed changes
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
              FutureBuilder(
              future: database.doc(uid).get(),
              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                                snapshot.data!.data() as Map<String, dynamic>;
                  return Column(

                  children: [
                    const SizedBox(
                      height: 30,
                    ),

                    Image.asset(
                      "assets/profile.png",
                      width: 180,
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 0),
                          alignment: Alignment.center,
                          child: Text(
                            //snap[index]['date'],
                            "Name: ${data['name']}",
                            // snap[index]['name'],
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              // color: Colors.green.withOpacity(0.7),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),


                    Container(
                      margin: const EdgeInsets.only(bottom: 0),
                      alignment: Alignment.center,
                      child: Text(
                        //snap[index]['date'],
                        "Email: ${data['email']}",
                        //snap[index]['email'],
                        style: const TextStyle(
                          color: Colors.black,
                          // color: Colors.green.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),


                    Container(
                      margin: const EdgeInsets.only(bottom:0) ,
                      alignment: Alignment.center,
                      child: Text(
                        //snap[index]['index'],
                        "Index: ${data['index']}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),

                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Container(
                      margin: const EdgeInsets.only(bottom: 0),
                      alignment: Alignment.center,
                      child: Text(
                        // snap[index]['batch'],
                        "Batch: ${data['batch']}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),


                    // Container(
                    //   margin: const EdgeInsets.only(bottom: 0),
                    //   alignment: Alignment.center,
                    //   child: Text(
                    //     // snap[index]['batch'],
                    //      snap[index]['image'],
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 15,
                    //     ),
                    //   ),
                    // ),
                  ],
    );
          }return const Text("loading");}),


            //const Text("\nProducts"),
            // StreamBuilder<QuerySnapshot>(
            //
            //   stream: FirebaseFirestore.instance.collection("profile").snapshots(),
            //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            //     if(snapshot.hasData) {
            //       final snap = snapshot.data!.docs;
            //
            //
            //       return ListView.builder(
            //         shrinkWrap: true,
            //         primary: false,
            //         itemCount: snap.length,
            //         itemBuilder: (context, index) {
            //           return Container(
            //             height: 600,
            //             width: double.infinity,
            //             margin: const EdgeInsets.only(bottom: 12),
            //             decoration: BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.circular(6),
            //               boxShadow: const [
            //                 BoxShadow(
            //                   color: Colors.black12,
            //                   //offset: Offset(1, 1),
            //                   blurRadius: 5,
            //                 ),
            //               ],
            //             ),
            //
            //
            //             child: Column(
            //               children: [
            //                 SizedBox(
            //                   height: 30,
            //                 ),
            //
            //                 Image.asset(
            //                   "assets/profile.png",
            //                   width: 180,
            //                 ),
            //
            //                 SizedBox(
            //                   height: 20,
            //                 ),
            //                 Container(
            //                   margin: const EdgeInsets.only(bottom: 0),
            //                   alignment: Alignment.center,
            //                   child: Text(
            //                     //snap[index]['date'],
            //                     "\Name: ${snap[index]['name']}",
            //                     // snap[index]['name'],
            //                     style: const TextStyle(
            //                       color: Colors.green,
            //                       fontSize: 20,
            //                       // color: Colors.green.withOpacity(0.7),
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //                   ),
            //                 ),
            //                 SizedBox(
            //                   height: 20,
            //                 ),
            //
            //
            //                 Container(
            //                   margin: const EdgeInsets.only(bottom: 0),
            //                   alignment: Alignment.center,
            //                   child: Text(
            //                     //snap[index]['date'],
            //                     "\Email: ${snap[index]['email']}",
            //                     //snap[index]['email'],
            //                     style: const TextStyle(
            //                       color: Colors.black,
            //                       // color: Colors.green.withOpacity(0.7),
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 15,
            //                     ),
            //                   ),
            //                 ),
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //
            //
            //                 Container(
            //                   margin: const EdgeInsets.only(bottom:0) ,
            //                   alignment: Alignment.center,
            //                   child: Text(
            //                     //snap[index]['index'],
            //                     "\Index: ${snap[index]['index']}",
            //                     style: TextStyle(
            //                         color: Colors.black,
            //                         fontWeight: FontWeight.bold,
            //                         fontSize: 15),
            //
            //                   ),
            //                 ),
            //
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //
            //                 Container(
            //                   margin: const EdgeInsets.only(bottom: 0),
            //                   alignment: Alignment.center,
            //                   child: Text(
            //                     // snap[index]['batch'],
            //                     "\Batch: ${snap[index]['batch']}",
            //                     style: TextStyle(
            //                       color: Colors.black,
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 15,
            //                     ),
            //                   ),
            //                 ),
            //
            //
            //                 Container(
            //                   margin: const EdgeInsets.only(bottom: 0),
            //                   alignment: Alignment.center,
            //                   child: Text(
            //                     // snap[index]['batch'],
            //                      snap[index]['image'],
            //                     style: TextStyle(
            //                       color: Colors.black,
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 15,
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           );
            //         },
            //       );
            //     } else {
            //       return const SizedBox();
            //     }
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
