import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Loginview extends StatefulWidget {
  const Loginview({Key? key}) : super(key: key);

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController emailControllerPlayer = TextEditingController();
  final TextEditingController emailControllerCoach = TextEditingController();
  final TextEditingController passwordControllerPlayer = TextEditingController();
  final TextEditingController passwordControllerCoach = TextEditingController();

  bool c = true;
  bool _obscurePasswordCoach = true;
  bool _keepLoggedInPlayer= false;
  bool _keepLoggedInCoach= false;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }





  
  void _loginPlayer() {
    if (_formKey.currentState!.validate()) {
      String role = _tabController.index == 0 ? "player" : "coach";
      print("Logging in as $role with ${emailControllerPlayer.text}");
      // 🔹 Use role in API call
    }
  }
  void _loginCoach() {
    if (_formKey.currentState!.validate()) {
      String role = _tabController.index == 0 ? "player" : "coach";
      print("Logging in as $role with ${emailControllerCoach.text}");
      // 🔹 Use role in API call
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Tab bar for Player / Coach
            Container(
              color: Colors.black,
              child: TabBar(
                controller: _tabController,
                indicatorColor: const Color(0xFF7DFF64),
                labelColor: const Color(0xFF7DFF64),
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: "PLAYER LOGIN"),
                  Tab(text: "COACH LOGIN"),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildLoginForm(h, w, "Player"),
                  _buildLoginForm(h, w, "Coach"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm(double h, double w, String roleTitle) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: w * 0.06),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: h * 0.05),

            // Logo Text
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "MY",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.4),
                        )
                      ],
                    ),
                  ),
                  TextSpan(
                    text: "PERFORMENCE",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      color: const Color(0xFF7DFF64),
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.4),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: h * 0.02),

            Text(
              "Enter as a $roleTitle ",
              style: const TextStyle(
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
                  color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
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
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
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

            // Log In Button
            SizedBox(
              width: double.infinity,
              height: h * 0.055,
              child: ElevatedButton(
                onPressed: _login,
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
                      wordSpacing: 1),
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
                  child:
                  Text("or", style: TextStyle(color: Colors.white)),
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
                _socialButton(FontAwesomeIcons.google, Colors.red),
                SizedBox(width: w * 0.05),
                _socialButton(FontAwesomeIcons.apple, Colors.white),
                SizedBox(width: w * 0.05),
                _socialButton(FontAwesomeIcons.facebook, Colors.blue),
              ],
            ),

            SizedBox(height: h * 0.03),

            // Sign Up
            GestureDetector(
              onTap: () {
                print("Sign up clicked for $roleTitle");
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
