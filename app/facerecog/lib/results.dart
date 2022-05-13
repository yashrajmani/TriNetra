import 'dart:convert';

import 'package:facerecog/home.dart';
import 'package:facerecog/loading.dart';
import 'package:facerecog/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'backend.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _Result();
}

class _Result extends State<Result> {


  //TODO: PUT API HOSTED WEBSITE URL HERE
  String url = 'http://10.0.2.2:8000/';
  String data = '';
  String result = '';
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
                  data = await fetchdata(url);
                  var decoded = jsonDecode(data);
                  setState(() {
                    result = decoded['msg'];
                  });
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
              result,
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
