import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class profileData extends StatefulWidget {
  const profileData({Key? key}) : super(key: key);

  @override
  State<profileData> createState() => _profileDataState();
}

class _profileDataState extends State<profileData> {
  GlobalKey<FormState> key = GlobalKey();

  //TextEditingController route = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController index = TextEditingController();
  TextEditingController batch = TextEditingController();
  CollectionReference ref = FirebaseFirestore.instance.collection('profile');


  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Profile Data"),),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),

              Container(

                //SizedBox(height: 60.0,),
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                child: TextFormField(
                  //validator: validator,
                  controller: name,
                  //style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Enter your name',
                      hintStyle: TextStyle(color: Colors.black45),
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
                  controller: email,
                  //style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: Colors.black45),
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
                  controller: index,
                  //style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Enter your index',
                      hintStyle: TextStyle(color: Colors.black45),
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
                  controller: batch,
                  //style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Enter your batch',
                      hintStyle: TextStyle(color: Colors.black45),
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
                      //Store the file
                      await referenceImageToUpload.putFile(File(file!.path));
                      imageUrl = await referenceImageToUpload.getDownloadURL();
                    } catch (error) {
                      //Some error occurred
                    }
                  },
                  icon: Icon(Icons.upload_file,size: 45.0),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  child:Text("UPLOAD PROFILE IMAGE")
              ),

              SizedBox(
                height: 35,
              ),


              MaterialButton(
                // margin: EdgeInsets.all(20),
                height: 50,
                color: Color.fromARGB(255, 0, 0, 0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                onPressed: () {
                  ref.add({
                    //'bus route': route.text,
                    'name': name.text,
                    'email': email.text,
                    'index': index.text,
                    'batch': batch.text,
                    'image': imageUrl,
                  });
                },
                child: Text(
                  '               SUBMIT               ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),

              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),

    );
  }
}




