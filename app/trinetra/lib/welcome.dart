import 'package:TriNetra/home.dart';
import 'package:TriNetra/realtime.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:  Center(
          child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 200.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/cognitive.gif') ,

                              fit: BoxFit.contain,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(300, 50),
                                maximumSize: const Size(300, 50),
                                primary: Colors.deepPurple,
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                              ),
                              ),
                              onPressed: () {
                                print("ARROW CLICKED !");

                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => Home()));
                              },


                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "UPLOAD"
                                  ),
                                  Icon(
                                    Icons.file_upload,
                                    size: 50,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(

                    thickness: 2,
                      endIndent: 20,
                      indent: 20,
                      color: Colors.blueAccent,
                    ),


                    Expanded(
                      child: SizedBox(
                        width: 200.0,
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage('assets/teachable.png') ,
                              fit: BoxFit.contain,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(300, 50),
                                maximumSize: const Size(300, 50),
                                primary: Colors.red,
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                              ),
                              onPressed: () {
                                print("ARROW CLICKED !");

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => RealTime()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "REALTIME "
                                  ),
                                  Icon(
                                    Icons.switch_video,
                                    size: 50,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                  ],


          ),
        )
    );
  }
}
