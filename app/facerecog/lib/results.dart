import 'package:facerecog/home.dart';
import 'package:facerecog/loading.dart';
import 'package:facerecog/welcome.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _Result();
}

class _Result extends State<Result> {
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
                fontSize: 40,
                fontWeight: FontWeight.w200,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Icon(
              Icons.notifications,
              size: 60,
            ),
            SizedBox(
              height: 20,
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
