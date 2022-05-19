import 'package:camera/camera.dart';
import 'package:facerecog/home.dart';
import 'package:facerecog/realtime.dart';
import 'package:facerecog/welcome.dart';
import 'package:flutter/material.dart';

List<CameraDescription>? cameras;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
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
      home: const Home(),
    );
  }
}
