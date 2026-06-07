import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreenV2 extends StatelessWidget {
  const SplashScreenV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(image: AssetImage("assets/background.png")),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/001-web-page-home 1.png"),
                  width: 50,
                ),
                SizedBox(width: 16),
                Text(
                  "HouseQu",
                  style: GoogleFonts.montserrat(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
