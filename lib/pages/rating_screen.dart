import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int _selectedRatingIndex = 2;
  final List<String> _emojis = ["😡", "😔", "😁", "😍"];

  Widget _buildRatingButton(int index) {
    final bool isSelected = _selectedRatingIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRatingIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xffEEF0FF) : const Color(0xff37394D),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(_emojis[index], style: const TextStyle(fontSize: 28)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181925),
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/pizza.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Pizza Balado",
                style: headingSemiBold.copyWith(color: Colors.white),
              ),
              SizedBox(height: 4),
              Text(
                "\$90,00",
                style: bodyNormal.copyWith(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 90),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Was it delicious?",
                  style: bodyMedium.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  _emojis.length,
                  (index) => _buildRatingButton(index),
                ),
              ),
              SizedBox(height: 90),
              SizedBox(
                width: 200,
                height: 56,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff34D186),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Text(
                    "Rate Now",
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
