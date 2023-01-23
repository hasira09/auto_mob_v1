import 'package:auto_mob_v1/front_end/auth_ui/log_in.dart';
import 'package:auto_mob_v1/front_end/auth_ui/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget commonTextFormField({required String hintText, required String? Function(String?)? validator, required TextEditingController textEditingController}){
  return Container(
    padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
    child: TextFormField(
      validator: validator,
      controller: textEditingController,
      //style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black26,
                width: 2.0,
              )
          )
      ),
    ),
  );
}

// Widget AuthButton(BuildContext context,String buttonName){
//   return Padding(
//     padding: const EdgeInsets.only(left: 20.0,right: 20.0, top:30.0),
//     child: ElevatedButton(
//       style: ElevatedButton.styleFrom(
//           minimumSize: Size(
//               MediaQuery.of(context).size.width - 30, 60.0),
//           elevation: 5.0,
//           primary: Color.fromARGB(255, 0, 0, 0),
//           padding: EdgeInsets.only(
//             left: 20.0,
//             right: 20.0,
//             top: 7.0,
//             bottom: 7.0,
//           ),
//           shape:  RoundedRectangleBorder(
//             borderRadius:
//             BorderRadius.all(Radius.circular(10.0)),
//           )),
//       child: Text(
//         buttonName,
//         style: TextStyle(
//           fontSize: 20.0,
//           letterSpacing: 1.0,
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//       onPressed: () async {
//
//       },
//     ),
//   );
// }


// Widget socialMediaIntegrationButtons(){
//   return Container(
//   width: double.maxFinite,
//   // height: double.maxFinite,
//   padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30),
//     child:    Column(
//       children: [
//
//       ],
//     ),
//   );
// }

// Widget socialMediaIntegrationButtons() {
//   return Container(
//     //width: double.maxFinite,
//     padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
//     child: Column(
//       children: [
//         Image.asset('assets/line.png', width: 350,),
//         //SizedBox(height: 50.0,),
//         GestureDetector(
//           onTap: (){
//             print('Google Pressed');
//           },
//           child:Image.asset('assets/google.png', width: 450,),
//         ),
//       ],
//     ),
//   );
// }


Widget switchToAnotherPage(BuildContext context,String firstName,String lastName){
  return ElevatedButton(

    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstName,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
            letterSpacing: 0.25,
            fontWeight: FontWeight.w400,
          ),
        ),

        Text(
          lastName,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.blue,
            letterSpacing: 0.25,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),

    style: ElevatedButton.styleFrom(
      elevation: 0.0,
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 40),
      primary: Color.fromRGBO(255, 255, 255, 1),),
    onPressed: (){
      if(lastName == 'Log-in')
      Navigator.push(context, MaterialPageRoute(builder: (_) => LogInPage()));
      else
        Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpPage()));
    },
  );
}