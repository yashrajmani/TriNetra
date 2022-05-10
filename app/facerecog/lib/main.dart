import 'package:facerecog/home.dart';
import 'package:facerecog/loading.dart';
import 'package:facerecog/uploadscreen.dart';
import 'package:facerecog/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Face());
}

class Face extends StatelessWidget {
  const Face({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Face Recognition',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
        appBarTheme: const AppBarTheme(
          color: Color(0xFF4530B2),
          elevation: 0,
        ),
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Welcome(),
    );
  }
}
