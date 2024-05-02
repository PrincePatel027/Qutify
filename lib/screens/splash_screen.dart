import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quotify/custom/colors/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      Navigator.of(context).pushReplacementNamed("/");
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      // body: Center(
      //   child: Container(
      //     padding: const EdgeInsets.only(left: 10),
      //     alignment: Alignment.center,
      //     height: 300,
      //     width: 300,
      //     child: Image.asset("assets/splash_screen/quotify_logo.png"),
      //   ),
      // ),
      body: Container(
        width: 430,
        height: 932,
        padding: const EdgeInsets.only(left: 94, right: 9),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFFE9EFE7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 327,
              height: 205,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/splash_screen/quotify_logo.png",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
