import 'package:auto_mob_v1/front_end/auth_ui/log_in.dart';
import 'package:auto_mob_v1/front_end/auth_ui/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget commonTextFormField(
    {required String hintText,
    required String? Function(String?)? validator,
    required TextEditingController textEditingController}) {
  return Container(
    padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
    child: TextFormField(
      validator: validator,
      controller: textEditingController,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black26,
            width: 2.0,
          ))),
    ),
  );
}

Widget switchToAnotherPage(
    BuildContext context, String firstName, String lastName) {
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
      primary: Color.fromRGBO(255, 255, 255, 1),
    ),
    onPressed: () {
      if (lastName == 'Log-in')
        Navigator.push(context, MaterialPageRoute(builder: (_) => LogInPage()));
      else
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => SignUpPage()));
    },
  );
}
