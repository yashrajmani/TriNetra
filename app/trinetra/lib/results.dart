import 'package:TriNetra/face.dart';
import 'package:TriNetra/welcome.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  List<Face>? face;
  Result({Key? key,required this.face}) : super(key: key);

  @override
  State<Result> createState() => _Result();
}

//TODO:MAKE THIS PAGE BETTER
class _Result extends State<Result> {
  get face => widget.face;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text("TriNetra"),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "RESULTS: ",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),


            const SizedBox(
              height: 10,
            ),

            const Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: Colors.blueGrey,
              height: 10,
            ),
            //-------------------------------------------------------------
            Text(
              "FACE ID: "+ face![0].faceId,
              style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),

            const Text(
              "RECTANGLE: Height-Width-Top-Left ",

              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  face![0].faceRectangle.height.toString()+"-",
                  style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),

                ),
                Text(
                  face![0].faceRectangle.width.toString()+"-" ,
                  style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),

                ),
                Text(
                  face![0].faceRectangle.top.toString()+"-" ,
                  style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),

                ),
                Text(
                  face![0].faceRectangle.left.toString() ,
                  style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),

                ),
              ],
            ),


            //-------------------------------------------------------------
            const Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: Colors.blueGrey,
              height: 10,
            ),

            //GENDER
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text(
                  "Gender : ",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  face![0].faceAttributes.gender.toString().toUpperCase() ,
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),

            //AGE
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text(
                  "Age : ",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                   face![0].faceAttributes.age.toString() ,
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),

            //--------------------------------------------------------

            const Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: Colors.blueGrey,
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text(
                  "ANGER : ",
                  style: TextStyle(
                      color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                   face![0].faceAttributes.emotion.anger.toString() ,
                  style: const TextStyle(
                      color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text(
                  "CONTEMPT: ",
                  style: TextStyle(
                      color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  face![0].faceAttributes.emotion.contempt.toString(),
                  style: const TextStyle(
                      color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text(
                  "DISGUST : ",
                  style: TextStyle(
                      color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  face![0].faceAttributes.emotion.disgust.toString(),
                  style: const TextStyle(
                      color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "FEAR : ",
                  style: TextStyle(
                      color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  face![0].faceAttributes.emotion.fear.toString(),
                  style: const TextStyle(
                      color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text(
                  "HAPPY : ",
                  style: TextStyle(
                      color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  face![0].faceAttributes.emotion.happiness.toString(),
                  style: const TextStyle(
                      color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text(
                  "NEUTRAL : ",
                  style: TextStyle(
                      color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  face![0].faceAttributes.emotion.neutral.toString() ,
                  style: const TextStyle(
                      color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text(
                  "SAD : ",
                  style: TextStyle(
                      color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  face![0].faceAttributes.emotion.sadness.toString() ,
                  style: const TextStyle(
                      color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text(
                  "SURPRISED : ",
                  style: TextStyle(
                      color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  face![0].faceAttributes.emotion.surprise.toString() ,
                  style: const TextStyle(
                      color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),

            const Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: Colors.blueGrey,
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                print("START OVER CLICKED!");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Welcome()),
                );
              },
              child: const Text(
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
