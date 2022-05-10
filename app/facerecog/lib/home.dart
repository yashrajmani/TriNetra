import 'package:facerecog/uploadscreen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      appBar: AppBar(
        title: const Text("Face Recognition"),
        centerTitle: true,
        actions: [
          Hero(
              tag: "logo",
              child: Image.asset(
                "assets/logo.png",
                color: Colors.white,
              )),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "CHOOSE:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w200,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Use Camera",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              //TODO: ADD CAMERA OPENER!
              onPressed: () {
                print("Camera Pressed!");
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Upload()));
              },

              child: Icon(
                Icons.camera,
                size: 50,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Divider(
              thickness: 4,
              height: 20,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Use Gallery",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                //TODO: ADD GALLERY OPENER
                print("Gallery Pressed!");
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Upload()));
              },
              child: Icon(
                Icons.photo_sharp,
                size: 50,
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
