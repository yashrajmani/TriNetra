import 'dart:async';
import 'package:TriNetra/home.dart';
import 'package:TriNetra/welcome.dart';
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
                    Text(
                      "TriNetra",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
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
                                child: Welcome(), type: PageTransitionType.fade));

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 40,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(100), // <-- Radius
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
