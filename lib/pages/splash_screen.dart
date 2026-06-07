import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff13131E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/001-swords 1.png"), width: 140),
            SizedBox(height: 170),
            Text(
              "VENTURE",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 32,
                color: Colors.white,
                letterSpacing: 2.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
