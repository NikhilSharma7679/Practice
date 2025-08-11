import 'package:experiment/Ui/LoginView/LoginView.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseAuthScreen extends StatelessWidget {
  const ChooseAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E1E1E), Color(0xFF3A3A3A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Overlay Title Text
              RichText(
                text:  TextSpan(
                  children: [
                    TextSpan(
                        text: "MY",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          // decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          // fontStyle: FontStyle.italic,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0, // spacing between letters
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.4),
                            )
                          ],
                        )



                    ),
                    TextSpan(
                        text: "PERFORMENCE",
                        style: TextStyle(
                          // fontFamily: "Oswald",
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          // fontStyle: FontStyle.italic,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0, // spacing between letters
                          color: Color(0xFF7DFF64),
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.4),
                            )
                          ],
                        )

                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Your Fitness Journey Starts Here",
                style: GoogleFonts.montserrat(
                  fontSize: size.width * 0.047,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),
              ),

              SizedBox(height: size.height * 0.05),

              // Login Button
              SizedBox(
                width: size.width * 0.8,
                height: size.height * 0.065,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to Login Screen
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Loginview(),));
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.montserrat(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Sign Up Button
              SizedBox(
                width: size.width * 0.8,
                height: size.height * 0.065,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7DFF64),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to Sign Up Screen
                  },
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.montserrat(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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
