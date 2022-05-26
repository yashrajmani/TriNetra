import 'package:TriNetra/face.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:TriNetra/results.dart';
import 'package:http/http.dart' as http;
import 'package:loading_indicator/loading_indicator.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatefulWidget {
  final String url;
  Loading({Key? key, required this.url}) : super(key: key);

  @override
  State<Loading> createState() => _Loading();
}

//TODO:MAKE THIS PAGE BETTER
class _Loading extends State<Loading> {
  List<Face>? face;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getFace();
  }

////////////////////// AZURE API ////////////////////////////////////////////////////////
//TODO: HANDLE EXCEPTION HERE | OK:200
  Future<List<Face>?> getData(String url) async {
    http.Response response = await http.post(
        Uri.parse(
            'https://yashfacerecog.cognitiveservices.azure.com/face/v1.0/detect?returnFaceId=true&returnFaceAttributes=emotion,age,gender&recognitionModel=recognition_04&returnRecognitionModel=false&detectionModel=detection_01&faceIdTimeToLive=86400'),
        headers: {
          "Ocp-Apim-Subscription-Key": "8a8001de4bc64983baea7fc0509d77e9",
          "Content-Type": "application/json",
        },
        body: jsonEncode({'url': url}));

    print(jsonDecode(response.body));
    List data = jsonDecode(response.body);
    print("THIS IS DATA :");
    print(data);

    return faceFromJson(response.body);
  }
////////////////////////////////////////////////////////////////////////////////

  getFace() async {
    face = await getData(widget.url);
    if (face != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TriNetra"),
        centerTitle: true,
      ),
      body: Center(
        child: isLoaded
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Thank you for your patience ♥",
                    style: TextStyle(fontSize: 15, fontFamily: "a Astro Space"),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Image(
                      image: AssetImage("assets/animated_logo.gif"),
                      height: 180,
                      width: 180),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    "LOADING COMPLETE",
                    style: TextStyle(fontSize: 30, fontFamily: "ITC Bauhaus"),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Result(face: face)));
                    },
                    child: Text("SEE RESULTS"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 50),
                      maximumSize: const Size(300, 50),
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                ],
              )
            : const Image(
                image: AssetImage("assets/load.gif"),
              ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
// LottieBuilder.network('https://assets8.lottiefiles.com/private_files/lf30_y5tq70sy.json')
