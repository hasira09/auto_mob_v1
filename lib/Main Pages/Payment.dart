import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  GlobalKey<FormState> key = GlobalKey();

  //TextEditingController route = TextEditingController();
  TextEditingController index = TextEditingController();
  TextEditingController month = TextEditingController();
  TextEditingController amount = TextEditingController();
  CollectionReference ref = FirebaseFirestore.instance.collection('payment');


  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment"),),

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
                  controller: index,
                  //style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Add your index number',
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
                  controller: month,
                  //style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Add payment month',
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
                  controller: amount,
                  //style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Add payment amount',
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
                        referenceRoot.child('images');

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
                      icon: Icon(Icons.upload_file,size: 35.0),
                  ),
                ),
              Container(
                  child:Text("UPLOAD SLIP")
              ),

              SizedBox(
                height: 20,
              ),


              MaterialButton(
                // margin: EdgeInsets.all(20),
                height: 40,
                color: Color.fromARGB(255, 0, 0, 0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                onPressed: () {
                  ref.add({
                    //'bus route': route.text,
                    'index': index.text,
                    'month': month.text,
                    'amount': amount.text,
                    'image':imageUrl,
                  });
                },
                child: Text(
                  '          SUBMIT          ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),

              SizedBox(
                height: 30,
              ),

              StreamBuilder<QuerySnapshot>(

                stream: FirebaseFirestore.instance.collection("payment").snapshots(),
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
                                margin: const EdgeInsets.only(left: 90),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  //snap[index]['date'],
                                  snap[index]['index'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    // color: Colors.green.withOpacity(0.7),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Container(
                                margin: const EdgeInsets.only(left: 170),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  //snap[index]['date'],
                                  "${snap[index]['month']}\ Payment Done",
                                  style: const TextStyle(
                                    color: Colors.green,
                                    // color: Colors.green.withOpacity(0.7),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Container(
                                margin: const EdgeInsets.only(left: 30),
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
      ),

    );

  }
}





















