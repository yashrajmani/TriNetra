import 'package:facerecog/face.dart';
import 'package:facerecog/remote_service.dart';
import 'package:facerecog/welcome.dart';
import 'package:flutter/material.dart';
import 'face.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _Result();
}

class _Result extends State<Result> {

  List<Face>? face;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    //FETCH DATA FROM API
    getFace();
  }
//TODO: FIX THE NULL ERROR AND WAIT TILL API IS PROCESSED
  getFace() async {
    face = await RemoteService().getData();
    if (face != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text("Face Recognition"),
        centerTitle: true,
        actions: [
          Image.asset(
            "assets/logo.png",
            color: Colors.white,
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "RESULTS: ",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20,
            ),


            SizedBox(
              height: 10,
            ),

            Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: Colors.blueGrey,
              height: 10,
            ),
            //-------------------------------------------------------------
            Text(
              "FACE ID : " + face![0].faceId,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),

            Text(
              "RECTANGLE =  Height: " +
                  face![0].faceRectangle.height.toString() +
                  " Width : " +
                  face![0].faceRectangle.width.toString() +
                  " Top : " +
                  face![0].faceRectangle.top.toString() +
                  " Left : " +
                  face![0].faceRectangle.left.toString(),
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),

            //-------------------------------------------------------------
            Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: Colors.blueGrey,
              height: 10,
            ),
            Text(
              "GENDER : " + face![0].faceAttributes.gender.toString(),
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "AGE: " + face![0].faceAttributes.age.toString(),
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),

            //--------------------------------------------------------

            Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: Colors.blueGrey,
              height: 10,
            ),
            Text(
              "ANGER : " + face![0].faceAttributes.emotion.anger.toString(),
              style: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              "CONTEMPT : " +
                  face![0].faceAttributes.emotion.contempt.toString(),
              style: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              "DISGUST : " + face![0].faceAttributes.emotion.disgust.toString(),
              style: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              "FEAR : " + face![0].faceAttributes.emotion.fear.toString(),
              style: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              "HAPPY : " + face![0].faceAttributes.emotion.happiness.toString(),
              style: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              "NEUTRAL : " + face![0].faceAttributes.emotion.neutral.toString(),
              style: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              "SAD : " + face![0].faceAttributes.emotion.sadness.toString(),
              style: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              "SURPRISED : " +
                  face![0].faceAttributes.emotion.surprise.toString(),
              style: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
            ),

            Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: Colors.blueGrey,
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                print("START OVER CLICKED!");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Welcome()),
                );
              },
              child: Text(
                "START OVER ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
