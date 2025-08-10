import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class Loginview extends StatefulWidget {
  const Loginview({Key? key}) : super(key: key);

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Player controllers
  final _playerFormKey = GlobalKey<FormState>();
  final playerEmailController = TextEditingController();
  final playerPasswordController = TextEditingController();
  bool playerObscurePassword = true;
  bool playerKeepLoggedIn = false;

  // Coach controllers
  final _coachFormKey = GlobalKey<FormState>();
  final coachEmailController = TextEditingController();
  final coachPasswordController = TextEditingController();
  bool coachObscurePassword = true;
  bool coachKeepLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Make status bar text/icons white for black background
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  void _loginPlayer() {
    if (_playerFormKey.currentState!.validate()) {
      print("Player logging in with ${playerEmailController.text}");
    }
  }

  void _loginCoach() {
    if (_coachFormKey.currentState!.validate()) {
      print("Coach logging in with ${coachEmailController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light, // White status bar icons
          automaticallyImplyLeading: false, // No back button
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // _buildTabButton("Player Login", 0),
                // _buildTabButton("Coach Login", 1),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildLoginForm(
              h: h,
              w: w,
              formKey: _playerFormKey,
              emailController: playerEmailController,
              passwordController: playerPasswordController,
              obscurePassword: playerObscurePassword,
              togglePassword: () {
                setState(() {
                  playerObscurePassword = !playerObscurePassword;
                });
              },
              keepLoggedIn: playerKeepLoggedIn,
              onKeepLoggedInChanged: (val) {
                setState(() {
                  playerKeepLoggedIn = val ?? false;
                });
              },
              onLogin: _loginPlayer,
            ),
            _buildLoginForm(
              h: h,
              w: w,
              formKey: _coachFormKey,
              emailController: coachEmailController,
              passwordController: coachPasswordController,
              obscurePassword: coachObscurePassword,
              togglePassword: () {
                setState(() {
                  coachObscurePassword = !coachObscurePassword;
                });
              },
              keepLoggedIn: coachKeepLoggedIn,
              onKeepLoggedInChanged: (val) {
                setState(() {
                  coachKeepLoggedIn = val ?? false;
                });
              },
              onLogin: _loginCoach,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm({
    required double h,
    required double w,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required bool obscurePassword,
    required VoidCallback togglePassword,
    required bool keepLoggedIn,
    required ValueChanged<bool?> onKeepLoggedInChanged,
    required VoidCallback onLogin,
  }) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: w * 0.06),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: h * 0.04),

            const Text(
              "Log In",
              style: TextStyle(
                fontFamily: "Bebas Neue",
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: h * 0.02),

            const Text(
              "To log in, please enter your phone number or email address and confirm your password.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: h * 0.04),

            // Email
            TextFormField(
              controller: emailController,
              style: const TextStyle(color: Colors.white),
              decoration: _inputDecoration("Email or Phone Number"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter email or phone number";
                }
                if (value.contains("@") &&
                    !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return "Enter a valid email";
                }
                return null;
              },
            ),
            SizedBox(height: h * 0.02),

            // Password
            TextFormField(
              controller: passwordController,
              obscureText: obscurePassword,
              style: const TextStyle(color: Colors.white),
              decoration: _inputDecoration("Password").copyWith(
                suffixIcon: IconButton(
                  icon: Icon(
                    obscurePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: togglePassword,
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

            // Keep me logged in
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.black,
                      value: keepLoggedIn,
                      activeColor: const Color(0xFF7DFF64),
                      onChanged: onKeepLoggedInChanged,
                    ),
                    const Text(
                      "Keep me logged in",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
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
                      color: Color(0xFF7DFF64),
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: h * 0.05),

            // Login button
            SizedBox(
              width: double.infinity,
              height: h * 0.055,
              child: ElevatedButton(
                onPressed: onLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7DFF64),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Log In",
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

            // Divider
            Row(
              children: [
                Expanded(
                  child: Divider(color: Colors.grey[700], thickness: 1),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text("or", style: TextStyle(color: Colors.white)),
                ),
                Expanded(
                  child: Divider(color: Colors.grey[700], thickness: 1),
                ),
              ],
            ),
            SizedBox(height: h * 0.025),

            // Social buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _socialButton(FontAwesomeIcons.google, Colors.red),
                SizedBox(width: w * 0.05),
                _socialButton(FontAwesomeIcons.apple, Colors.white),
                SizedBox(width: w * 0.05),
                _socialButton(FontAwesomeIcons.facebook, Colors.blue),
              ],
            ),

            SizedBox(height: h * 0.02),

            // Sign up
            GestureDetector(
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: h * 0.02),
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
