import 'dart:io';
import 'package:TriNetra/loading.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:TriNetra/face.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  bool isLoading = false;
  File? image;
  String imgurl = '';
  bool urlload = false;

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

  uploadPic(File image) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    String url = '';
    Reference ref = storage.ref().child("image" + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(image);
    uploadTask.whenComplete(() async {
      url = await ref.getDownloadURL();
      print(url);
      setState(() {
        imgurl = url;
        urlload = true;
      });
    }).catchError((onError) {
      print(onError);
    });
    print(urlload);
  }


  //TODO: SAVE IMAGE TEMPORARILY SAVE STORAGE
  Future<File> saveImagePermanently(String imagePath) async {
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
        title: const Text("TriNetra"),
        centerTitle: true,
      ),

      bottomNavigationBar: SizedBox(
        width: 10,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.black87,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(0),
            ),
          ),

          onPressed: () async {
            print("CONFIRM TAPPED");
            uploadPic(image!);
            setState(() {
              isLoading = true;
              if (image == null) {
                Fluttertoast.showToast(
                    msg: "Sorry : NO IMAGE FOUND !",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            });



            await Future.delayed(const Duration(seconds: 6), () {
              if (imgurl != '') {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Loading(url: imgurl)));
              }
            });
          },
          child: isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Uploading...',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(width: 10),
                    CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ],
                )
              : const Text('Confirm'),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              "CHOOSE: ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                color: Colors.red
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            image != null
                ? Image.file(
                    image!,
                    height: 160,
                    width: 160,
                    fit: BoxFit.cover,
                  )
                : Container(
                    width: 160,
                    height: 160,
                    child: Image.asset(
                      "assets/imageicon.png",
                    ),
                  ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              "Use Camera",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.indigo
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
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  maximumSize: const Size(200, 50),
                  primary: Colors.blue,
                  onPrimary: Colors.white),

              child: Icon(
                Icons.camera,
                size: 50,
              ),

            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              color: Colors.red,
              thickness: 2,
              height: 20,
              indent: 20,
              endIndent: 20,
            ),
            Text(
              "Use Gallery",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                  color: Colors.indigo,
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
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
                maximumSize: const Size(200, 50),
                primary: Colors.purple,
                onPrimary: Colors.white),
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
