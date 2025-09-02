import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'ChooseAuthViewModel.dart';

class ChooseAuthScreen extends StatefulWidget {
  const ChooseAuthScreen({super.key});

  @override
  State<ChooseAuthScreen> createState() => _ChooseAuthScreenState();
}

class _ChooseAuthScreenState extends State<ChooseAuthScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _titleSlide;
  late Animation<Offset> _buttonSlide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _titleSlide =
        Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
        );

    _buttonSlide =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
        );

    // start animation when screen loads
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // ✅ Transparent status bar
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return ViewModelBuilder<ChooseAuthViewModel>.reactive(
      viewModelBuilder: () => ChooseAuthViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: Stack(
            children: [
              // Background
              Container(
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
                      // Animated Title
                      SlideTransition(
                        position: _titleSlide,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "MY",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      offset: const Offset(2, 2),
                                      blurRadius: 4,
                                      color: Colors.black.withOpacity(0.4),
                                    )
                                  ],
                                ),
                              ),
                              TextSpan(
                                text: "PERFORMANCE",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0,
                                  color: const Color(0xFF7DFF64),
                                  shadows: [
                                    Shadow(
                                      offset: const Offset(2, 2),
                                      blurRadius: 4,
                                      color: Colors.black.withOpacity(0.4),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Sub title
                      FadeTransition(
                        opacity: _controller,
                        child: Text(
                          "Your Fitness Journey Starts Here",
                          style: GoogleFonts.montserrat(
                            fontSize: size.width * 0.047,
                            fontWeight: FontWeight.w500,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),

                      // Animated Buttons
                      SlideTransition(
                        position: _buttonSlide,
                        child: Column(
                          children: [
                            // Login
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
                                onPressed: () => model.openCard("Login"),
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
                            // Sign Up
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
                                onPressed: () => model.openCard("Sign Up"),
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
                    ],
                  ),
                ),
              ),

              // Animated Card Overlay
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: model.showCard
                    ? GestureDetector(
                  onTap: model.closeCard,
                  child: Container(
                    width: size.width,
                    height: size.height,
                    color: Colors.black54,
                    alignment: Alignment.center,
                    child: AnimatedScale(
                      scale: model.showCard ? 1.0 : 0.8,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutBack,
                      child: Container(
                        width: size.width * 0.8,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${model.actionType} As",
                              style: GoogleFonts.montserrat(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            // Coach
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: Size(size.width * 0.6, 50),
                              ),
                              onPressed: () =>
                                  model.navigateToRole("Coach"),
                              child: Text(
                                "Coach",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Player
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: Size(size.width * 0.6, 50),
                              ),
                              onPressed: () =>
                                  model.navigateToRole("Player"),
                              child: Text(
                                "Player",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        );
      },
    );
  }
}
