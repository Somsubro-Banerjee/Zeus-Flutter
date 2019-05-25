import 'package:flutter/material.dart';
import 'package:zeus/ui/Sign_up.dart';
import 'dart:ui';
import 'Home.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_dart/actor_artboard.dart';
import 'package:flare_flutter/flare_actor.dart';

class LoginUi extends StatefulWidget {
  @override
  _LoginUiState createState() => _LoginUiState();
}
class _Login_data{
  String email = "";
  String password = "";
}
class _LoginUiState extends State<LoginUi> {
  final _textControllerLogin = TextEditingController();
  final _textControllerpass = TextEditingController();
  bool _validateLogin = false;
  bool _validatePass = false;
  String _animationName = "idle";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
        children: <Widget>[
          
          new Container(
            margin: EdgeInsets.fromLTRB(100, 85, 0.0, 0.0),
            child: new Text("ZEUS",
            style: new TextStyle(
              letterSpacing: 5,
              color: Colors.blue,
              fontSize: 80,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),),
          ),  
          new Container(
            margin: EdgeInsets.fromLTRB(110, 200, 0.0, 0.0),
            child: new Text("Login for awesomeness!!",
            style: new TextStyle(

              letterSpacing: 5,
              color: Colors.blue,
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w100,
            ),),
          ),  
          // Text("Error"),
          // new Container(
          //   margin: EdgeInsets.fromLTRB(20, 200, 20.0, 0.0),
          //   child: FlareActor(
          //   "assets/teddy.flr2d",
          //   alignment: Alignment.center,
          //   fit: BoxFit.cover,
          //   animation: _animationName,
          //   ),
            
            
          // ),
          new Container(// user ID / Email
             margin: EdgeInsets.fromLTRB(20, 370, 20, 0.0),
            // alignment: Alignment.centerLeft,
            child: new TextField(
              // new Text("enter your email"),
              style: TextStyle(color: Colors.blue),
              controller: _textControllerLogin,
              keyboardType: TextInputType.emailAddress,
              decoration: new InputDecoration(
                // fillColor: Colors.transparent,
                // filled: true,
              
                labelText: "Please enter your Email-id",
                labelStyle: TextStyle(color: Colors.blue),
                errorText: _validateLogin ? 'Email Feild cannot be empty' : null,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                borderSide: new BorderSide(color: Colors.blue),),
                 icon: new Icon(Icons.email, color: Colors.blue,),
                
              ),
            ),
          ),
          // Text("Error"),
          new Container( //Password 
             margin: EdgeInsets.fromLTRB(20, 480, 20, 0.0),
            // alignment: Alignment.centerLeft,
            child: new TextField(
              style: TextStyle(color: Colors.blue),
              controller: _textControllerpass,
              keyboardType: TextInputType.text,
              obscureText: true,
              cursorColor: Colors.pink,
              decoration: new InputDecoration(
                // fillColor: Colors.blueGrey,
                // filled: true,
                labelText: "Please enter your Password",
                labelStyle: TextStyle(color: Colors.blue),
                errorText: _validatePass ? 'Password Feild Cannot be empty' : null,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                borderSide: new BorderSide(color: Colors.white),),
                 icon: new Icon(Icons.text_format, color: Colors.blue,),
              ),
            ),
          ),

          new Container( //submit for login button 
            margin: EdgeInsets.fromLTRB(60, 580, 20, 0.0),
            child: new RaisedButton(onPressed: () {
              
              setState(() {
               _textControllerLogin.text.isEmpty ?  _validateLogin = true : 
               _textControllerpass.text.isEmpty ? _validatePass = true : _validatePass = false;
               if (_textControllerLogin.text.isEmpty)
               {
                 return _validateLogin;
               }else if(_textControllerpass.text.isEmpty){
                 return _validatePass;
               }else{
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
               }
               
              });
            },
            textColor: Colors.white,
            child: new Text("Submit And Login"),
            elevation: 5.0,
            color: Colors.blue,
            
            ),
          ),

          new Container( // for signup button 
            margin: EdgeInsets.fromLTRB(240, 580, 20, 0.0),
            child: new RaisedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
            },
            textColor: Colors.white,
            child: new Text("Sign up now!"),
            elevation: 5.0,
            color: Colors.blue,
            ),
          ),
          
        ],
      )
      
    );
  }
}

