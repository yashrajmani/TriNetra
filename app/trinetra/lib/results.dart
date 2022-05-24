import 'package:TriNetra/face.dart';
import 'package:TriNetra/remote_service.dart';
import 'package:TriNetra/welcome.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _Result();
}

//TODO:MAKE THIS PAGE BETTER
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
        title: const Text("TriNetra"),
        centerTitle: true,
        actions: [
          Image.asset(
            "assets/logo.png",
          ),
        ],
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
              face![0].faceId,
              style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),

            const Text(
              "RECTANGLE =  H W  T L ",

              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  face![0].faceRectangle.height.toString(),
                  style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),

                ),
                Text(
                  face![0].faceRectangle.width.toString() ,
                  style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),

                ),
                Text(
                  face![0].faceRectangle.top.toString() ,
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
                  "GENDER : ",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  face![0].faceAttributes.gender.toString() ,
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
                  "AGE: ",
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
