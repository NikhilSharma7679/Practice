import 'package:experiment/Constants/ConstantsStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loginview extends StatefulWidget {
  const Loginview({super.key});

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
       appBar:  AppBar(
         title: Text("Login"),
          backgroundColor:Color(0xFF0000FF), // FF = full opacity, 0000FF = blue
          titleTextStyle:  TextStyle(color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.bold,
              letterSpacing: 1, wordSpacing: 1),
          centerTitle: true,
          // leading: IconButton(onPressed: () {
          //
          // }, icon: Icon(CupertinoIcons.back,color: Colors.white,)),


        ),
body: Center(
  child: SingleChildScrollView(
    child: Column(
      children: [
        Text("Email",style: TextStyle(letterSpacing: 1,wordSpacing: 1,fontSize: 15,color: Colors.black


        ),),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            style: kTextFieldTextStyle,
            decoration: kInputDecoration.copyWith(hintText: "Email Address"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            style: kTextFieldTextStyle,
            decoration: kInputDecoration.copyWith(hintText: "Password"),
          ),
        )

      ],
    ),
  ),
),

    );
  }
}
