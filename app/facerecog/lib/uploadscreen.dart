import 'package:facerecog/loading.dart';
import 'package:flutter/material.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _Upload();
}

class _Upload extends State<Upload> {
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
              "UPLOAD FILE:",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w200,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              //TODO: OPEN FILES APP FOR VIDEO!
              onPressed: () {
                print("File Upload Clicked!");
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Loading()));
              },

              child: Icon(
                Icons.file_upload,
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
