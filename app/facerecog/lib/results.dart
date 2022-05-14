import 'dart:convert';

import 'package:facerecog/home.dart';
import 'package:facerecog/loading.dart';
import 'package:facerecog/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'backend.dart';
import 'package:http/http.dart' as http;

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _Result();
}

class _Result extends State<Result> {

  ////////////////////// AZURE API ////////////////////////////////////////////////////////
  Future<http.Response?> getData() async {
    http.Response response = await http.post(
        Uri.parse(
            'https://yashfacerecog.cognitiveservices.azure.com/face/v1.0/detect?returnFaceId=true&returnFaceAttributes=emotion,age,gender&recognitionModel=recognition_04&returnRecognitionModel=false&detectionModel=detection_01&faceIdTimeToLive=86400'),
        headers: {
          "Ocp-Apim-Subscription-Key": "8a8001de4bc64983baea7fc0509d77e9",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          'url':
              'https://img.freepik.com/free-photo/close-up-confident-male-employee-white-collar-shirt-smiling-camera-standing-self-assured-against-studio-background_1258-26761.jpg?w=2000',
        }));
    print(jsonDecode(response.body));
    return null;
  }
////////////////////////////////////////////////////////////////////////////////

  ///// TEST API /////////////////////////////////////////////////////
  // //TODO: PUT API HOSTED WEBSITE URL HERE
  // String url = 'http://10.0.0.1:8000/';
  // String data = '';
  // String result = '';

  ///////////////////////////////////////////////////////////////////
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
              "MATCHED WITH",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w200,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
                color: Colors.blue,
                //CALLING API
                onPressed: () async {
                  getData();
                  ////////////////// TEST API /////////////
                  // data = await fetchdata(url);
                  // var decoded = jsonDecode(data);
                  // setState(() {
                  //   result = decoded['msg'];
                  //});
                  //////////////////////////////////////
                },
                child: Text(
                  "SEE API",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )),
            SizedBox(
              height: 40,
            ),
            Text(
              'result',
              style: TextStyle(
                  color: Colors.red, fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                print("START OVER CLICKED!");
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Welcome()));
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
