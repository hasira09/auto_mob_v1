import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'View Profile.dart';

class profileData extends StatefulWidget {
  const profileData({Key? key}) : super(key: key);

  @override
  State<profileData> createState() => _profileDataState();
}

class _profileDataState extends State<profileData> {
  GlobalKey<FormState> key = GlobalKey();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController index = TextEditingController();
  TextEditingController batch = TextEditingController();
  CollectionReference ref = FirebaseFirestore.instance.collection('Data');

  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Update Profile Data",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: Image.asset("assets/icons/back.png"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ViewProfilePage()));
          },
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          child: Column(
            children: [
              Column(
                children: const [
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 10.0),
                child: TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                      hintText: 'Enter your name',
                      hintStyle: TextStyle(color: Colors.black45),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.black26,
                        width: 2.0,
                      ))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 10.0),
                child: TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: Colors.black45),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.black26,
                        width: 2.0,
                      ))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 10.0),
                child: TextFormField(
                  controller: index,
                  decoration: const InputDecoration(
                      hintText: 'Enter your index',
                      hintStyle: TextStyle(color: Colors.black45),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.black26,
                        width: 2.0,
                      ))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 10.0),
                child: TextFormField(
                  controller: batch,
                  decoration: const InputDecoration(
                      hintText: 'Enter your batch',
                      hintStyle: TextStyle(color: Colors.black45),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.black26,
                        width: 2.0,
                      ))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: IconButton(
                  onPressed: () async {
                    ImagePicker imagePicker = ImagePicker();
                    XFile? file =
                        await imagePicker.pickImage(source: ImageSource.camera);
                    print('${file?.path}');

                    if (file == null) return;
                    String uniqueFileName =
                        DateTime.now().millisecondsSinceEpoch.toString();

                    Reference referenceRoot = FirebaseStorage.instance.ref();
                    Reference referenceDirImages =
                        referenceRoot.child('profile');

                    Reference referenceImageToUpload =
                        referenceDirImages.child('name');

                    try {
                      await referenceImageToUpload.putFile(File(file!.path));
                      imageUrl = await referenceImageToUpload.getDownloadURL();
                      print(imageUrl);
                    } catch (error) {}
                  },
                  icon: const Icon(Icons.upload_file, size: 45.0),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(child: const Text("UPLOAD PROFILE IMAGE")),
              const SizedBox(
                height: 35,
              ),
              MaterialButton(
                height: 50,
                color: const Color.fromARGB(255, 0, 0, 0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                onPressed: () {
                  final FirebaseAuth auth = FirebaseAuth.instance;
                  final User? user = auth.currentUser;
                  final uid = user!.uid;
                  FirebaseFirestore.instance.collection("Data").doc(uid).set({
                    'name': name.text,
                    'email': email.text,
                    'index': index.text,
                    'batch': batch.text,
                    'image': imageUrl,
                  });
                },
                child: const Text(
                  '               SUBMIT               ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
