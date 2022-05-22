import 'dart:async';
import 'package:TriNetra/welcome.dart';
import 'package:flutter/material.dart';

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
    //TODO:ANIMATE THIS
    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const Welcome())));

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SafeArea(
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
                            image: AssetImage('assets/logo.png'),
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
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                    ]),
              ),
            )));
  }
}
