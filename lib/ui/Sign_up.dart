import 'package:flutter/material.dart';
import 'dart:ui';
import 'login_interface.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
   TextEditingController _textControllerLogin = TextEditingController();
  TextEditingController _textControllerpass = TextEditingController();
  String email ="";
  String pass = "";
  bool _validateLogin = false;
  bool _validatePass = false;
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
            child: new Text("Sign up for awesomeness!!",
            style: new TextStyle(

              letterSpacing: 5,
              color: Colors.blue,
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w100,
            ),),
          ),  
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
                 prefixIcon: new Icon(Icons.email, color: Colors.blue,),
                
              ),
            ),
          ),

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
                 prefixIcon: new Icon(Icons.text_format, color: Colors.blue,),
              ),
            ),
          ),
        new Container( // for signup button 
            margin: EdgeInsets.fromLTRB(130, 580, 20, 0.0),
            child: new RaisedButton(onPressed: () {
              setState(() {
               _textControllerLogin.text.isEmpty ?  _validateLogin = true : 
               _textControllerpass.text.isEmpty ? _validatePass = true : _validatePass = false;
               if (_textControllerLogin.text.isEmpty){
                 return _validateLogin;
               }else if(_textControllerpass.text.isEmpty){
                 return _validatePass;
               }else{
                 Navigator.push(context, MaterialPageRoute(builder: (context) => LoginUi()));
                //  new SnackBar(
                //    content: Text("Sign up process complete!! "),
                //  );
               }
               
              });
              // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginUi()));
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