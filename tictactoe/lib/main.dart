import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tictactoe/homepage.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  TextStyle textFont = GoogleFonts.pressStart2p(
      fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Text(
              'Tic Tac Toe',
              style: textFont,
            ),
          )),
          Expanded(
            child: Container(
              child: AvatarGlow(
                endRadius: 140,
                duration: const Duration(seconds: 2),
                glowColor: Colors.white,
                repeat: true,
                repeatPauseDuration: const Duration(seconds: 1),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.none),
                      shape: BoxShape.circle),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey[900],
                    child: Container(
                      child: Image.asset(
                        'assets/logo.png',
                        color: Colors.white,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Created by @BunnyHoops',
                textAlign: TextAlign.center,
                style: textFont.copyWith(height: 2),
              ),
            ),
          )),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const HomePage())));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.085,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  'Play Game',
                  style: textFont.copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
