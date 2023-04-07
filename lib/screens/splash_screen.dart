import 'dart:async';

import 'package:bordered_text/bordered_text.dart';
import 'package:covid_tracker/screens/world_stats_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.repeat();

    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => WorldStatsScreen(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animation.removeListener(() {});
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background-image.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(colors: [Colors.white, Colors.transparent], radius: 0.18),
                ),
              ),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) => Transform.rotate(
                  angle: _animation.value * 6.3,
                  child: Image.asset('assets/images/covid-virus.png'),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 50),
                  child: BorderedText(
                    strokeWidth: 2,
                    child: Text(
                      'TraceTogether',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
