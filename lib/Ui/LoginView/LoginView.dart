import 'package:experiment/Constants/ConstantsStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Loginview extends StatefulWidget {
  const Loginview({super.key});

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

body: SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 111,),
        Center(child: Text("Login to Start Your Journey",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.5,wordSpacing: 1,letterSpacing: 1),)),
        Center(child: Text("with the App",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.5,wordSpacing: 1,letterSpacing: 1),)),

        SizedBox(height: 30,),
        Padding(
          padding:  EdgeInsets.only(left: 15,right: 8,bottom: 8,top: 8),
          child: Text("Email",style: TextStyle(letterSpacing: 1,wordSpacing: 1,fontSize: 15,color: Colors.black54


          ),),
        ),
        Padding(
          padding:  EdgeInsets.only(left: 8,right: 8,bottom: 8),
          child: TextFormField(
            style: kTextFieldTextStyle,
            decoration: kInputDecoration.copyWith(hintText: "Enter Your  Email"),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(left: 15,right: 8,bottom: 8,top: 8),
          child: Text("Password",style: TextStyle(letterSpacing: 1,wordSpacing: 1,fontSize: 15,color: Colors.black54



          ),),
        ),
  Padding(
    padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
    child: TextFormField(
      obscureText: _obscurePassword,
      style: kTextFieldTextStyle,
      decoration: kInputDecoration.copyWith(
        hintText: "Enter Your Password",
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,color: Colors.black38
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
      ),
    ),
  ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
          alignment: Alignment.centerRight,
          child: Text("Forget password?",style: TextStyle(color: Colors.blueAccent,fontSize: 14,wordSpacing: 1,letterSpacing: 1,fontWeight: FontWeight.normal),)),
    ),
        SizedBox(height: 30,),
        Center(
          child: SizedBox(
            width: 344,
            child: ElevatedButton(
              style: kBlueButtonStyle,
              onPressed: () {
                // your logic
              },
              child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 16,wordSpacing: 1,letterSpacing: 1,fontWeight: FontWeight.bold),),
            ),
          ),
        ),
        SizedBox(height: 30,),
    Center(child: Text("or continue with ",style: TextStyle(color: Colors.black38,fontSize: 16,wordSpacing: 1,letterSpacing: 1,fontWeight: FontWeight.normal),)),
        SizedBox(height: 15,),
    Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // White background
              foregroundColor: Colors.black, // Text & icon color
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
                side: const BorderSide(color: Colors.black12), // Black border
              ),
              elevation: 0,
            ),
            onPressed: () {
              // Handle Google login here
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
              Image.asset("assets/images/googleicon.png",height: 13,),
                const SizedBox(width: 10),
                const Text(
                  "Google",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ],
            )


          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // White background
                foregroundColor: Colors.black, // Text & icon color
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                  side: const BorderSide(color: Colors.black12), // Black border
                ),
                elevation: 0,
              ),
              onPressed: () {
                // Handle Google login here
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(FontAwesomeIcons.apple),

                  const SizedBox(width: 10),
                  const Text(
                    "Apple",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),




          ),
        ],
      ),

    ),

        Padding(
          padding: const EdgeInsets.only(left: 12,right: 12,top: 140),
          child: Center(
            child: RichText(
              text: TextSpan(
                text: "Don't have an account? ",
                style: TextStyle(color: Colors.black87, fontSize: 14),
                children: [
                  TextSpan(
                    text: "Sign up",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigate to signup screen
                        Navigator.pushNamed(context, '/signup'); // or your route
                      },
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ),
  ),
),

    );
  }
}
