import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/cover.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Maximize Revenue",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Gain more profit from cryptocurrency\nwithout any risk involved",
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.login, size: 34),
                color: Colors.white,
                style: IconButton.styleFrom(
                  backgroundColor: Color(0xff877BFB),
                  padding: EdgeInsets.all(24),
                ),
              ),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
