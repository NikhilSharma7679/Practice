import 'package:experiment/Constants/ConstantsStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: Colors.grey[50],
       // appBar:  AppBar(
       //   title: Text("Login"),
       //    backgroundColor:Color(0xFF0000FF), // FF = full opacity, 0000FF = blue
       //    titleTextStyle:  TextStyle(color: Colors.white,
       //        fontSize: 19,
       //        fontWeight: FontWeight.bold,
       //        letterSpacing: 1, wordSpacing: 1),
       //    centerTitle: true,
       //    // leading: IconButton(onPressed: () {
       //    //
       //    // }, icon: Icon(CupertinoIcons.back,color: Colors.white,)),
       //
       //
       //  ),
body: SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 111,),
        Center(child: Padding(
          padding:  EdgeInsets.only(top: 34,right: 39,left: 56),
          child: Text("Login to Start Your Journey",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,wordSpacing: 1,letterSpacing: 1),),
        )),
        Center(child: Text("with the App",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,wordSpacing: 1,letterSpacing: 1),)),

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


      ],
    ),
  ),
),

    );
  }
}
