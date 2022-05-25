import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'main.dart';

class RealTime extends StatefulWidget {
  const RealTime({Key? key}) : super(key: key);

  @override
  State<RealTime> createState() => _Home();
}

class _Home extends State<RealTime> {
  FlutterTts flutterTts = FlutterTts();
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '---';

  @override
  void initState() {
    super.initState();
    loadCamera();
    loadmodel();
  }

  Future speak(String word) async {
    await flutterTts.setLanguage("en-IN");
    await flutterTts.setSpeechRate(0.8);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(word);
  }

  loadCamera() {
    cameraController = CameraController(cameras![0], ResolutionPreset.high);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          cameraController?.startImageStream((image) {
            cameraImage = image;
            runModel();
          });
        });
      }
    });
  }

  bool isVibrate = false;
  bool isSpeech = false;

  runModel() async {
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
          bytesList: cameraImage!.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 2,
          threshold: 0.1,
          asynch: true);

      predictions?.forEach((element) {
        setState(()  {
          output = element['label'];
          // 0 ANGRY
          // 1 SAD
          // 2 HAPPY
          // 3 DISGUST

          if (output == '0 ANGRY') {
            if (isVibrate == true) {
              Vibration.vibrate(pattern: [50, 1000, 50, 1000]);
            }
            if (isSpeech == true) {
              speak("ANGRY");
            }
          }
          else if (output == '1 SAD') {
            if (isVibrate == true) {
              Vibration.vibrate(pattern: [300, 1000, 300, 1000]);
            }
            if (isSpeech == true) {
              speak("SAD");
            }
            // w v w v
          }
          else if (output == '2 HAPPY')
          {
            if (isVibrate == true) {
              Vibration.vibrate(pattern: [50, 50, 50, 50]);
            }
            if (isSpeech == true) {
              speak("HAPPY");
            }
          }
          else if (output == '3 DISGUST') {
            if (isVibrate == true) {
              Vibration.vibrate(pattern: [100, 100, 100, 100]);
            }
            if (isSpeech == true) {
              speak("DISGUST");
            }
          } else {
            Vibration.cancel();
            flutterTts.pause();
          }
        });
      });
    }
  }

  // TODO: ADD NEW TFLITE MODEL by teachable machines.

  loadmodel() async {
    await Tflite.loadModel(
        model: "assets/model_unquant.tflite", labels: "assets/labels.txt");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TriNetra"),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(Icons.vibration),
                    Switch(
                      value: isVibrate,
                      onChanged: (value) {
                        setState(() {
                          isVibrate = value;
                        });
                      },
                      activeTrackColor: Colors.blueAccent,
                      activeColor: Colors.blue,
                    ),
                  ],
                ),
                const Text(
                  "CAMERA ON !",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(children: [
                  Icon(Icons.record_voice_over),
                  Switch(
                    value: isSpeech,
                    onChanged: (value) {
                      setState(() {
                        isSpeech = value;
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ])
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: !cameraController!.value.isInitialized
                    ? Container()
                    : AspectRatio(
                        aspectRatio: cameraController!.value.aspectRatio,
                        child: CameraPreview(cameraController!),
                      ),
              ),
            ),
            Text(
              output,
              style: const TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
