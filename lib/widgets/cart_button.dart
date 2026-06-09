import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final double height;
  final double width;

  const CartButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.height = 60.0,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    // Primary styling
    final Color buttonColor = isPrimary ? const Color(0xffFFC238) : const Color(0xffD9D9D9);
    final Color textColor = isPrimary ? const Color(0xff0E1954) : Colors.white;
    final List<BoxShadow> shadow = isPrimary
        ? [
            BoxShadow(
              color: const Color(0xffFFC238).withValues(alpha: 0.3),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ]
        : [];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: shadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(30),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
