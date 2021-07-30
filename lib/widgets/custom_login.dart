import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startup/controllers/authentication.dart';

class CustomLogin extends StatelessWidget {
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "Asset/firebase_logo.png",
              width: 100.0,
              height: 100.0,
            ),
            SizedBox(height: 190.0),
            Text(
              "Firebase Auth",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontFamily: GoogleFonts.pacifico().fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 195.0,
            ),
            Container(
              width: 200.0,
              child: MaterialButton(
                onPressed: () {
                  authController.signInWithGoogle();
                },
                height: 50.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.google),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        "Go with google",
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ),
                  ],
                ),
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
