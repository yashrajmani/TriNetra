import 'package:facerecog/home.dart';
import 'package:facerecog/realtime.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //TODO: WORK WITH BACKGROUND PUT A NEW UI
        backgroundColor: Color(0xFF4530B2),
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Center(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Text(
                    "FACE RECOGNITION",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Expanded(
                      child: Hero(
                    tag: "logo",
                    child: Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                          invertColors: true,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                    ),
                    onPressed: () {
                      print("ARROW CLICKED !");

                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Icon(
                      Icons.arrow_forward_sharp,
                      size: 50,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: () {
                      print("ARROW CLICKED !");

                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => RealTime()));
                    },
                    child: Icon(
                      Icons.camera_front,
                      size: 50,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
