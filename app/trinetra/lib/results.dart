import 'package:TriNetra/face.dart';
import 'package:TriNetra/home.dart';
import 'package:TriNetra/trinetra.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restart/flutter_restart.dart';

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
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
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
                  fontSize: 10,
              ),
            ),

            const Text(
              "RECTANGLE: Height-Width-Top-Left ",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 12,
              ),
            ),

            // RECTANGLE DATA --------------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  face![0].faceRectangle.height.toString()+"-",
                  style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 12,
                  ),

                ),
                Text(
                  face![0].faceRectangle.width.toString()+"-" ,
                  style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 12,
                      ),

                ),
                Text(
                  face![0].faceRectangle.top.toString()+"-" ,
                  style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 12,
                      ),

                ),
                Text(
                  face![0].faceRectangle.left.toString() ,
                  style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 12,
                      ),

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
                      fontFamily: 'ITC Bauhaus',
                      color: Colors.green,
                      fontSize: 30,
                  ),
                ),
                Text(
                  face![0].faceAttributes.gender.toString().toUpperCase() ,
                  style: const TextStyle(
                      fontFamily: 'ITC Bauhaus',
                      color: Colors.indigo,
                      fontSize: 30,
                  ),
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
                      fontSize: 30,
                      fontFamily: 'ITC Bauhaus',
                  ),
                ),
                Text(
                   face![0].faceAttributes.age.toString() ,
                  style: const TextStyle(
                      fontFamily: 'ITC Bauhaus',
                      color: Colors.indigo,
                      fontSize: 30,
                  ),
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
            Text("EMOTIONS:",
            style: TextStyle(
              fontFamily: "a Astro Space",
              fontSize: 30,
              color: Colors.purple
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text(
                  "ANGER : ",
                  style: TextStyle(
                      color: Colors.blue, fontSize: 20,),
                ),
                Text(
                   face![0].faceAttributes.emotion.anger.toString() ,
                  style: const TextStyle(
                      color: Colors.red, fontSize: 20,),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text(
                  "CONTEMPT: ",
                  style: TextStyle(
                      color: Colors.blue, fontSize: 20),
                ),
                Text(
                  face![0].faceAttributes.emotion.contempt.toString(),
                  style: const TextStyle(
                      color: Colors.red, fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text(
                  "DISGUST : ",
                  style: TextStyle(
                      color: Colors.blue, fontSize: 20),
                ),
                Text(
                  face![0].faceAttributes.emotion.disgust.toString(),
                  style: const TextStyle(
                      color: Colors.red, fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "FEAR : ",
                  style: TextStyle(
                      color: Colors.blue, fontSize: 20),
                ),
                Text(
                  face![0].faceAttributes.emotion.fear.toString(),
                  style: const TextStyle(
                      color: Colors.red, fontSize: 20),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text(
                  "HAPPY : ",
                  style: TextStyle(
                      color: Colors.blue, fontSize: 20),
                ),
                Text(
                  face![0].faceAttributes.emotion.happiness.toString(),
                  style: const TextStyle(
                      color: Colors.red, fontSize: 20),
                ),
              ],
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text(
                  "NEUTRAL : ",
                  style: TextStyle(
                      color: Colors.blue, fontSize: 20),
                ),
                Text(
                  face![0].faceAttributes.emotion.neutral.toString() ,
                  style: const TextStyle(
                      color: Colors.red, fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text(
                  "SAD : ",
                  style: TextStyle(
                      color: Colors.blue, fontSize: 20),
                ),
                Text(
                  face![0].faceAttributes.emotion.sadness.toString() ,
                  style: const TextStyle(
                      color: Colors.red, fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text(
                  "SURPRISED : ",
                  style: TextStyle(
                      color: Colors.blue, fontSize: 20),
                ),
                Text(
                  face![0].faceAttributes.emotion.surprise.toString() ,
                  style: const TextStyle(
                      color: Colors.red, fontSize: 20),
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
              onPressed: () async {
               await FlutterRestart.restartApp();
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  maximumSize: const Size(200, 50),
                  primary: Colors.deepPurple,
                  onPrimary: Colors.white),
              child: Row(
                children: [
                  Text(
                    "START OVER ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.restart_alt,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
