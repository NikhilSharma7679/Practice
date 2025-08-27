import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../PlayerHomepage/PlayerHomeView.dart';
import '../../PlayerUI/PlayerHomepage/PlayerHomeView.dart';

class CoachLoginview extends StatefulWidget {
  const CoachLoginview({Key? key}) : super(key: key);

  @override
  State<CoachLoginview> createState() => _CoachLoginviewState();
}

class _CoachLoginviewState extends State<CoachLoginview> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _keepLoggedIn = false;

  void _login() {
    if (_formKey.currentState!.validate()) {
      print("Logging in with ${emailController.text}");

      // 🔹 API call here
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // makes it blend with your UI
        statusBarIconBrightness: Brightness.light, // icons will be white
        statusBarBrightness: Brightness.dark, // for iOS
      ),
    );
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: h * 0.05),

                      // PEAKFIT Logo
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
                                  fontSize: 28,
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
                                text: "PERFORMANCE",
                                style: TextStyle(
                                  // fontFamily: "Oswald",
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                  // fontStyle: FontStyle.italic,
                                  fontSize: 26,
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
                      SizedBox(height: h * 0.02),
                      RichText(
                        text:  TextSpan(
                          children: [
                            TextSpan(
                                text: "Enter ",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  // decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                  // fontStyle: FontStyle.italic,
                                  fontSize: 26,
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
                                text: "As",
                                style: TextStyle(
                                  // fontFamily: "Oswald",
                                  // decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                  // fontStyle: FontStyle.italic,
                                  fontSize: 24,
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
                            TextSpan(
                                text: " Coach",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  // decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                  // fontStyle: FontStyle.italic,
                                  fontSize: 26,
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
                          ],
                        ),
                      ),
                      // const Text(
                      //   "Enter As Coach",
                      //   style: TextStyle(
                      //       fontFamily: "Bebas Neue",
                      //       fontSize: 25,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.white),
                      // ),
                      SizedBox(height: h * 0.02),

                      const Text(
                        "To log in, please enter your phone number or email address and confirm your password.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: h * 0.04),

                      // Email / Phone
                      TextFormField(
                        controller: emailController,
                        style: const TextStyle(color: Colors.white),
                        decoration: _inputDecoration("Email or Phone Number"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter email or phone number";
                          }
                          if (value.contains("@") &&
                              !RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: h * 0.02),

                      // Password
                      TextFormField(
                        controller: passwordController,
                        obscureText: _obscurePassword,
                        style: const TextStyle(color: Colors.white),
                        decoration: _inputDecoration("Password").copyWith(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter password";
                          }
                          if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: h * 0.015),

                      // Keep me logged in + Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.black,
                                value: _keepLoggedIn,
                                activeColor: const Color(0xFF7DFF64),
                                onChanged: (value) {
                                  setState(() {
                                    _keepLoggedIn = value ?? false;
                                  });
                                },
                              ),
                              const Text(
                                "Keep me logged in",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13,fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              print("Forgot password clicked");
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Color(0xFF7DFF64), fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: h * 0.05),

                      // Log In Button (Always Green)
                      SizedBox(
                        width: double.infinity,
                        height: h * 0.055,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => TrainingPageView(),));
                          },
                          // onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7DFF64),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Log In",
                            style: TextStyle(
                                fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold,letterSpacing: 1,wordSpacing: 1),
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.035),

                      // OR Divider
                      Row(
                        children: [
                          Expanded(
                              child: Divider(color: Colors.grey[700], thickness: 1)),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text("or",
                                style: TextStyle(color: Colors.white)),
                          ),
                          Expanded(
                              child: Divider(color: Colors.grey[700], thickness: 1)),
                        ],
                      ),
                      SizedBox(height: h * 0.025),

                      // Social Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _socialButton(
                              FontAwesomeIcons.google, Colors.red),
                          SizedBox(width: w * 0.05),
                          _socialButton(
                              FontAwesomeIcons.apple, Colors.white),
                          SizedBox(width: w * 0.05),
                          _socialButton(
                              FontAwesomeIcons.facebook, Colors.blue),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Sign Up
            Padding(
              padding: EdgeInsets.only(bottom: h * 0.02),
              child: GestureDetector(
                onTap: () {
                  print("Sign up clicked");
                },
                child: RichText(
                  text: const TextSpan(
                    text: "Don't you have an account? ",
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                            color: Color(0xFF7DFF64),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.grey[900],
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget _socialButton(IconData icon, Color color) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Icon(icon, color: color, size: 22),
    );
  }
}
