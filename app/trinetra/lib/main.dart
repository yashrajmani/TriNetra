import 'package:TriNetra/trinetra.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


//todo : put a vibration sense
//TODO : ADD SPEAKING SENSE !!!!!!!!!

List<CameraDescription>? cameras;

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();
  runApp(const Face());
}

class Face extends StatelessWidget {
  const Face({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TriNetra',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Raleway',
        appBarTheme: const AppBarTheme(
          color: Color(0xFF000316),
          elevation: 3,
        ),
        primarySwatch: Colors.blue,
     ),
      home: const Trinetra(),
    );
  }
}




//TODO: USE NAMED ROUTES
//FLOW :
//1: trinetra -- 5 sec welcome screen
//2: welcome -- two options

//3: realtime-- live camera emotion

//4: home -- add an image
//5: loading -- busy screen till the API is received.
//6: results-- response by API

// face - class for face data as api response
// remote_service- backend for API




