import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    var newFont = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.white, letterSpacing: 3),
      fontSize: 15,
    );
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Text(
                "TIC TAC TOE",
                style: newFont.copyWith(fontSize: 25),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: AvatarGlow(
                    duration: const Duration(seconds: 2),
                    glowColor: Colors.white,
                    repeat: true,
                    startDelay: const Duration(seconds: 1),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.none),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.grey[900],
                        child: Container(
                          child: Image.asset(
                            'lib/images/tic-tac-toe.png',
                            color: Colors.white,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Text(
                "Play Now",
                style: newFont.copyWith(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
