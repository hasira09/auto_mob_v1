import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'front_end/auth_ui/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      title: 'AutoMob',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: SignUpPage(),
    ),
  );
}