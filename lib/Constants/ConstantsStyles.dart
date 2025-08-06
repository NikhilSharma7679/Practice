import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final AppBar appbarDesignBasic = AppBar(
  backgroundColor:Color(0xFF0000FF), // FF = full opacity, 0000FF = blue
  titleTextStyle:  TextStyle(color: Colors.white,
  fontSize: 16,
  letterSpacing: 1, wordSpacing: 1),
centerTitle: true,
  leading: IconButton(onPressed: () {

  }, icon: Icon(CupertinoIcons.back,color: Colors.white,)),
);
const kInputDecoration = InputDecoration(

  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(22)),
    borderSide: BorderSide(color: Colors.black12),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(22)),
    borderSide: BorderSide(color: Colors.black12),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(22)),
    borderSide: BorderSide(color: Colors.blue, width: 0.5),
  ),
  filled: true,
  fillColor: Color(0xFFFFFFFF),// 50% transparent white


    hintStyle: TextStyle(color: Colors.grey),
);
const kTextFieldTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.black87,
);
const kBlueButtonStyle = ButtonStyle(

    backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
  foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
  padding: MaterialStatePropertyAll<EdgeInsets>(
    EdgeInsets.symmetric(vertical: 14, horizontal: 24),
  ),
  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
  elevation: MaterialStatePropertyAll<double>(0),
);
