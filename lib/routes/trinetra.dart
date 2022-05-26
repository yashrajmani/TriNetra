import 'package:TriNetra/routes/welcome.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Trinetra extends StatefulWidget {
  const Trinetra({Key? key}) : super(key: key);
  @override
  State<Trinetra> createState() => _TrinetraState();
}

class _TrinetraState extends State<Trinetra> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Expanded(
                        child: Container(
                      width: 250.0,
                      height: 250.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/animated_logo.gif'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    )),
                    const Text(
                      "TriNetra",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(
                      height:  MediaQuery.of(context).size.height * 0.02,
                    ),
                    const Text(
                      "An EYE for the needy",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'ITC Bauhaus',
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    ElevatedButton(

                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: const Welcome(), type: PageTransitionType.fade));

                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(100), // <-- Radius
                        ),
                          primary:Colors.deepPurple,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 40,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    )
                  ]
              ),
            )
        )
    );
  }
}
