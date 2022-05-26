import 'package:TriNetra/loading.dart';
import 'package:TriNetra/trinetra.dart';
import 'package:TriNetra/welcome.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
        fontFamily: 'a Astro Space',
        appBarTheme: const AppBarTheme(
          color: Color(0xFF000316),
          elevation: 3,
        ),

        primarySwatch: Colors.blue,

     ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Trinetra(),
        '/second': (context) => const Welcome(),
      },
    );
  }
}




//FLOW :
//1: trinetra -- 5 sec welcome screen
//2: welcome -- two options

//3.2: realtime-- live camera emotion

//3.1: home -- add an image
//5: loading -- busy screen till the API is received.
//6: results-- response by API

// face - class for face data as api response
// remote_service- backend for API




