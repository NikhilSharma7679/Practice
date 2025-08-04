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
    borderSide: BorderSide(color: Colors.blue),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(22)),
    borderSide: BorderSide(color: Colors.blueGrey),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(22)),
    borderSide: BorderSide(color: Colors.blueAccent, width: 0.5),
  ),
  filled: true,
  fillColor: Color(0x80FFFFFF),// 50% transparent white

    hintStyle: TextStyle(color: Colors.grey),
);
const kTextFieldTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.black87,
);
