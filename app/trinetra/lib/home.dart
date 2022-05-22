import 'dart:io';
import 'package:TriNetra/results.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}
// TODO: use the local image as body(url) for api in remote_service.

class _Home extends State<Home> {
  File? image;

  Future pickImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) {
        return;
      } else {
        print("IMAGE FOUND");
      }

      final imagePermanent = await saveImagePermanently(image.path);
      setState(() {
        this.image = imagePermanent;
      });
    } on PlatformException catch (e) {
      print("FAILED : $e");
    }
  }

  Future<File> saveImagePermanently(String imagePath) async
  {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }


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
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.black12,
        child: InkWell(
          onTap: () {
            print("CONFIRM TAPPED");
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Result()));
          },
          child: Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.check),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
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
              height: 10,
            ),
            image != null
                ? Image.file(
              image!,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            )
                : FlutterLogo(
              size: 150,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Use Camera",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () {
                pickImage(ImageSource.camera);
                print("Camera Pressed!");
              },

              child: Icon(
                Icons.camera,
                size: 50,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 4,
              height: 20,
              indent: 20,
              endIndent: 20,
            ),
            Text(
              "Use Gallery",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () {
                //TODO: ADD GALLERY OPENER
                print("Gallery Pressed!");
                pickImage(ImageSource.gallery);
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