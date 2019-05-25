import 'package:flutter/material.dart';
import 'dart:ui';
import './ui/Home.dart';
import './ui/login_interface.dart';
void main()
{
  runApp(
    new MaterialApp(
      title : "Zeus",
      home : new LoginUi(),
      debugShowCheckedModeBanner: false,
      // routes: <String, WidgetBuilder> {
      //   "/second_page" : (BuildContext context ) => LoginUi()
      // },
    )
  );
}
