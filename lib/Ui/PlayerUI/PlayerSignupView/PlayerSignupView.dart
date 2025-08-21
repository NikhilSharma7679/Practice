import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayerSignupView extends StatefulWidget {
  const PlayerSignupView({Key? key}) : super(key: key);

  @override
  State<PlayerSignupView> createState() => _PlayerSignupViewState();
}

class _PlayerSignupViewState extends State<PlayerSignupView> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _signup() {
    if (_formKey.currentState!.validate()) {
      print("Signing up ${firstNameController.text}");
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
                                text: " Player",
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
                      // Title
                      // RichText(
                      //   text: TextSpan(
                      //     children: [
                      //       TextSpan(
                      //         text: "MY",
                      //         style: _titleTextStyle(Colors.white, 28),
                      //       ),
                      //       TextSpan(
                      //         text: "PERFORMENCE",
                      //         style: _titleTextStyle(const Color(0xFF7DFF64), 26, underline: true),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(height: h * 0.02),
                      Center(
                        child: const Text(
                          "Create your coach account by filling in the details below",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: h * 0.04),

                      // First Name
                      _buildTextField(
                        controller: firstNameController,
                        hint: "First Name",
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "First name is required";
                          }
                          if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                            return "Enter a valid name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: h * 0.02),

                      // Last Name (Optional)
                      _buildTextField(
                        controller: lastNameController,
                        hint: "Last Name (Optional)",
                        validator: (value) {
                          if (value != null && value.isNotEmpty && !RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                            return "Enter a valid last name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: h * 0.02),

                      // Mobile Number
                      _buildTextField(
                        controller: mobileController,
                        hint: "Mobile Number",
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Mobile number is required";
                          }
                          if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
                            return "Enter a valid mobile number";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: h * 0.02),

                      // Email
                      _buildTextField(
                        controller: emailController,
                        hint: "Email",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email is required";
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: h * 0.02),

                      // Password
                      _buildTextField(
                        controller: passwordController,
                        hint: "Password",
                        obscureText: _obscurePassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password is required";
                          }
                          if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: h * 0.02),

                      // Confirm Password
                      _buildTextField(
                        controller: confirmPasswordController,
                        hint: "Confirm Password",
                        obscureText: _obscureConfirmPassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please confirm your password";
                          }
                          if (value != passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: h * 0.04),

                      // Sign Up Button
                      SizedBox(
                        width: double.infinity,
                        height: h * 0.055,
                        child: ElevatedButton(
                          onPressed: _signup,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7DFF64),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              wordSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.035),

                      // OR Divider
                      Row(
                        children: [
                          Expanded(child: Divider(color: Colors.grey[700], thickness: 1)),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text("or", style: TextStyle(color: Colors.white)),
                          ),
                          Expanded(child: Divider(color: Colors.grey[700], thickness: 1)),
                        ],
                      ),
                      SizedBox(height: h * 0.015),

                      // Social Buttons
                      Padding(
                        padding:  EdgeInsets.only(bottom: h * 0.11 ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _socialButton(FontAwesomeIcons.google, Colors.red),
                            SizedBox(width: w * 0.05),
                            _socialButton(FontAwesomeIcons.apple, Colors.white),
                            SizedBox(width: w * 0.05),
                            _socialButton(FontAwesomeIcons.facebook, Colors.blue),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Login
            Padding(
              padding: EdgeInsets.only(bottom: h * 0.01),
              child: GestureDetector(
                onTap: () {
                  print("Go to Login Screen");
                },
                child: RichText(
                  text: const TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: "Log In",
                        style: TextStyle(
                          color: Color(0xFF7DFF64),
                          fontWeight: FontWeight.bold,
                        ),
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

  // Title Text Style
  TextStyle _titleTextStyle(Color color, double fontSize, {bool underline = false}) {
    return TextStyle(
      fontFamily: "Poppins",
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      decorationColor: Colors.white,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.0,
      color: color,
      shadows: [
        Shadow(
          offset: const Offset(2, 2),
          blurRadius: 4,
          color: Colors.black.withOpacity(0.4),
        )
      ],
    );
  }

  // Input Field Widget
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    String? Function(String?)? validator,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[900],
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }

  // Social Button Widget
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
