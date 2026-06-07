import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181A20),
      body: Padding(
        padding: EdgeInsetsGeometry.fromLTRB(40, 70, 40, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage("assets/currency.png"),
              width: 50,
              height: 50,
            ),
            SizedBox(height: 70),
            Text(
              "Welcome back.\nLet’s make money.",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 70),
            _textFormField("Email"),
            SizedBox(height: 20),
            _textFormField("Password", obscureText: true),
            SizedBox(height: 20),
            Container(
              alignment: AlignmentGeometry.xy(1, 0.6),
              child: Text(
                "Forgot password?",
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.white70),
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Color(0xffFCAC15),
                minimumSize: Size.fromHeight(55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                "Sign In",
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff6B4909),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  " Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFormField(String hintText, {bool obscureText = false}) {
    return TextFormField(
      style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
      decoration: InputDecoration(
        fillColor: Color(0xff262A34),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        contentPadding: EdgeInsets.all(16),
        hintText: hintText,
        suffixIcon: obscureText ? Icon(Icons.visibility) : null,
        hintStyle: GoogleFonts.poppins(fontSize: 16, color: Color(0xff6F7075)),
      ),
      obscureText: obscureText,
    );
  }
}
