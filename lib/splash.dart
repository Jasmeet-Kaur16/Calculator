import 'dart:ui' show FontStyle, FontWeight;

import 'package:flutter/material.dart';

import 'main.dart';

class Splash extends StatefulWidget{
  const Splash({ Key? key}): super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatehome();
  }

  _navigatehome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration:  const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assests/images/download.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                height: 150,
                width: 150,
              ),
              Container(
                child: const Text('Calculator',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontStyle: FontStyle.normal,

                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: const Text('By: Jasmeet Kaur',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: const Text('Roll No.:102116124',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}