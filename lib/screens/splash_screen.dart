import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';
import 'dice_screen.dart';
import 'inicio_screen.dart';
import 'login_screen.dart';
import 'menu_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';

  const SplashScreen({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(const Duration(seconds: 6)).then((_) {
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushReplacementNamed(context, MenuScreen.id);
      } else {
        Navigator.pushReplacementNamed(context, InicioScreen.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //return Scaffold(

    // body: Center(
    //   child: SizedBox(
    //     width: 250,
    //     height: 250,
    return Container(
      color: Colors.blue,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('lib/assets/images-3.jpeg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
