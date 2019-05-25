import 'package:flutter/material.dart';
import 'dart:ui';
import 'login_interface.dart';
import 'package:zeus/main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: new Text("Zeus"),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          new IconButton( icon: Icon(Icons.person_outline),
          color: Colors.white,
          onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSettings()),);
          }
          )
        ],
      ),
      drawer: Drawer(
       child: new Column(
         children: <Widget>[
           new UserAccountsDrawerHeader(
            //  accountName: new Text("Somsubro Banerjee",
            //  style: new TextStyle(color: Colors.white, 
            //  fontWeight: FontWeight.bold,
            //  fontSize: 20)
            //  ),
             accountEmail: new Text("usersEmailAddress@gmail.com"),
             currentAccountPicture: new CircleAvatar(
               backgroundColor: Colors.indigoAccent,
               child: new Text("User",
               style: new TextStyle(fontSize: 30),),
             ),
           ),

           new ListTile(
             title: new Text("Pay"),
             onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => PayInternet()),);
             },
           ),
           new ListTile(
             title: new Text("Send Money to Bank"),
             onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MoneyToBank()),);
             },
           ),
           new ListTile(
             title: new Text("Link UPI/bank Accounts"),
             onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => UPI()),);
             }
           ),
           new ListTile(
             title: new Text("Account Settings"),
             onTap:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSettings()),);
             },
           ),
           new ListTile(
             title: new Text("Recent Transactions"),
             onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => RecentTransactions()),);
             }
           ),
           new ListTile( 
             title: new Text('Logout'),
             onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => LoginUi()),);}
           )
         ],
       ), 
      ),


      floatingActionButton: new FloatingActionButton(
        
        child: new Stack(
          children: <Widget>[
            new Icon(Icons.nfc)
          ],
        ),
        elevation: 10,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PayNFC()),);
        },
      ),

      body: new Stack(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.topCenter,
            child: new  CircleAvatar(
              backgroundColor: Colors.blue,
              child: new Text("User",
              style: new TextStyle(
                color: Colors.white,
                fontSize: 70,
              ),),
              radius: 80,
            ),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(20, 200, 20, 200),
            alignment: Alignment.topCenter,
           child: new Text("Hello usersEmailAddress@gmail.com!!",
           style: new TextStyle(
             color: Colors.purple,
             fontSize: 20,
             fontWeight: FontWeight.bold,
           ),) ,
          ),

          new Container(
            margin: EdgeInsets.fromLTRB(100, 350, 20, 300),
            alignment: Alignment.centerLeft,
            child: new ButtonTheme(
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40)),
              minWidth: 200.0,
              height: 100.0,
              child: RaisedButton(
                elevation: 10,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddMoney()),);
                },
                child: new Text("Add Money", 
                style: new TextStyle(color: Colors.white,
                fontSize: 20),
                ),
              ),
            )
          ),
          new Container(
            // margin: EdgeInsets.fromLTRB(20, 450, 20, 350),
            padding: EdgeInsets.all(50),
            margin: EdgeInsets.all(50),
            alignment: Alignment.bottomCenter,
            child: new ButtonTheme(
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(100)),
              minWidth: 500.0,
              height: 100.0,
              child: RaisedButton(
                elevation: 10,
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => PayInternet()),);},
                child: new Text("Pay", 
                style: new TextStyle(color: Colors.white,
                fontSize: 40),
                ),
              ),
            )
          ),
         

          // new Container(
          //   margin: EdgeInsets.fromLTRB(20, 300, 20, 300),
          //   alignment: Alignment.center,
          //   child: new RaisedButton(
          //     color: Colors.blue,
          //     child: new Text("pay",
          //     style: new TextStyle(color: Colors.white),),
          //     onPressed: () => debugPrint("pay was tapped"),
          //   ),
          // )
        ],
      ),
    );
  }
}

class PayNFC extends StatefulWidget {
  @override
  _PayNFCState createState() => _PayNFCState();
}

class _PayNFCState extends State<PayNFC> {
  TextEditingController _AmountController = new TextEditingController();
  bool _ValidateAmount = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: new  AppBar(
        title: new Text("NFC Gate"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.all(50),
            alignment: Alignment.topCenter,
            child: new Text("Enter amount To Pay",
            style: new TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold
            )),
          ),
          new Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(20),
            child: new Theme(
              data: new ThemeData(
                primaryColor: Colors.white,
                primaryColorDark: Colors.amber,

              ),
              child: 
              new TextField(
                
                controller: _AmountController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white,),
                decoration: new InputDecoration(
                  errorText: _ValidateAmount ? "Amount Cannot Be Empty": null,
                  border: new OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.white,

                    ),
                  ),
                  labelText: "Enter the amount to pay",
                  labelStyle: new TextStyle(color: Colors.white),
                  helperText: "Ex : 2000",
                  helperStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white,
                  prefixIcon: new Icon(Icons.attach_money,
                  color: Colors.white,),

                ),
              
              ),
            ),
          ),
          new Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.all(50),
            child: new RaisedButton(
              onPressed: () {
                setState(() {
                 if(_AmountController.text.isEmpty){
                   return _ValidateAmount = true;
                 } else{
                   Navigator.push(context, MaterialPageRoute(builder: (context) => PayViaNFC()),);
                 }
                });
              },
              elevation: 10,
              child: Text("Pay"),
            ),
          )
        ],
      ),
    );
  }
}

class PayViaNFC extends StatefulWidget {
  @override
  _PayViaNFCState createState() => _PayViaNFCState();
}

class _PayViaNFCState extends State<PayViaNFC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: new Text("Pay Via NFC"),
        centerTitle: true,
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.all(50),
            alignment: Alignment.topCenter,
            child: new Icon(Icons.nfc,
            color: Colors.white,
            size: 300,),
          ),
          new Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(20),
            child: Text("Searching for nearby NFC Devices......",
            style: new TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
          ),
          new Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(20, 150, 20, 20),
            child: Text("Standby.....",
            style: new TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ],
      ),
    );
  }
}
 class PayInternet extends StatefulWidget {
   @override
   _PayInternetState createState() => _PayInternetState();
 }
 
 class _PayInternetState extends State<PayInternet> {
   TextEditingController _AmountController = new TextEditingController();
   bool _ValidateAmount = false ;
   bool _validateEmail = false;
   TextEditingController _emailController =new TextEditingController();

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.green,
         title: new Text("Pay Via Internet"),
         centerTitle: true,

       ),
       backgroundColor: Colors.green,

       body: new Stack(
         children: <Widget>[
           new Container(
            margin: EdgeInsets.all(5),
            alignment: Alignment.topCenter,
            child: new Icon(Icons.payment,
            color: Colors.white,
            size: 200,),
          ),
          new Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(20),
            child: new Theme(
              data: new ThemeData(
                primaryColor: Colors.white,
                primaryColorDark: Colors.amber,

              ),
              child: 
              new TextField(
                
                controller: _AmountController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white,),
                decoration: new InputDecoration(
                  errorText: _ValidateAmount ? "Amount Cannot Be Empty": null,
                  border: new OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.white,

                    ),
                  ),
                  labelText: "Enter the amount to pay",
                  labelStyle: new TextStyle(color: Colors.white),
                  helperText: "Ex : 2000",
                  helperStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white,
                  prefixIcon: new Icon(Icons.attach_money,
                  color: Colors.white,),

                ),
              
              ),
            ),
          ),
           new Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(20, 200, 20, 0.0),
            child: new Theme(
              data: new ThemeData(
                primaryColor: Colors.white,
                primaryColorDark: Colors.amber,

              ),
              child: 
              new TextField(
                
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white,),
                decoration: new InputDecoration(
                  errorText: _ValidateAmount ? "Email Cannot Be Empty": null,
                  border: new OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.white,

                    ),
                  ),
                  labelText: "Enter the Email of the reciever",
                  labelStyle: new TextStyle(color: Colors.white),
                  helperText: "Ex : abcd@gmail.com",
                  helperStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white,
                  prefixIcon: new Icon(Icons.attach_money,
                  color: Colors.white,),

                ),
              
              ),
            ),
          ),
          new Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.bottomCenter,
            child: new RaisedButton(
              elevation: 10.0,
              onPressed: () {
                setState(() {
                 if (_AmountController.text.isEmpty) {
                   return _ValidateAmount = true;
                 } else if(_emailController.text.isEmpty){
                   return _validateEmail = true;
                 } else{
                   Navigator.push(context, MaterialPageRoute(builder: (context) => PayViaInternet()),);
                 }
                });
              },
              child: new Text("Pay"),
            ),
          )
         ],
       ),
     );
   }
 }

 class PayViaInternet extends StatefulWidget {
   @override
   _PayViaInternetState createState() => _PayViaInternetState();
 }
 
 class _PayViaInternetState extends State<PayViaInternet> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: new Text("Pay Via Internet"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Stack(
        children: <Widget>[
          new Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(20),
            child: new Icon(Icons.search,
            size: 200,
            color: Colors.white,
            ),
            
          ),
          new Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(20, 400, 20, 0.0),
            child: new Text("Searching for users with given email"+ "\n"+ "\n"+ '\t'
            +"Standby.....",
            style:  TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
        ],
      ),
       
     );
   }
 }

 class AddMoney extends StatefulWidget {
   @override
   _AddMoneyState createState() => _AddMoneyState();
 }
 
 class _AddMoneyState extends State<AddMoney> {
   List<String> _banks = ['State Bank Of India','Indian bank', "Bank of Maharashtra", 'Banl of Baroda', 'Punjab Natonal Bank', 'IDBI Bank','ICICI Bank','Axis Bank', 'Yes Bank', 'HDFC Bank', 'Bank of Andhra'];
   String _selectBanks;
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.red,
       appBar: AppBar(
         title: new Text("Add Money to wallet"),
         centerTitle: true,
         backgroundColor: Colors.red,
       ),
       body: new Stack(
         children: <Widget>[
           new Container(
             margin: EdgeInsets.all(20),
             alignment: Alignment.topCenter,
             child: new Icon(Icons.monetization_on,
             size: 200,
             color: Colors.white,),
           ),

           new Container(
             margin: EdgeInsets.all(20),
             alignment: Alignment.centerLeft,
             child: new Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(20, 60, 20, 0.0),
            child: new Theme(
              data: new ThemeData(
                primaryColor: Colors.white,
                primaryColorDark: Colors.amber,

              ),
              child: 
              new TextField(
                
                // controller: _emailController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white,),
                decoration: new InputDecoration(
                  // errorText: _ValidateAmount ? "Email Cannot Be Empty": null,
                  border: new OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.white,

                    ),
                  ),
                  labelText: "Enter the amount to add",
                  labelStyle: new TextStyle(color: Colors.white),
                  helperText: "Ex : 10,000",
                  helperStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white,
                  prefixIcon: new Icon(Icons.attach_money,
                  color: Colors.white,),

                ),
              
              ),
            ),
          ),

           ),
           new Container(
             alignment: Alignment.center,
             margin: EdgeInsets.fromLTRB(0.0, 250, 0.0, 0.0),
             child: new DropdownButton(
               hint: Text("Selet your bank",
               style: new TextStyle(color: Colors.white),),
               onChanged: (newValue) {
                 setState(() {
                  _selectBanks =newValue ;
                 });
               },
               items: _banks.map((banks){
                 return DropdownMenuItem(child: new Text(banks),
                 value: banks,);
               }).toList(),
             ),
           ),
           new Container(
             alignment: Alignment.bottomCenter,
             margin: EdgeInsets.all(20),
             child: new RaisedButton(
               child: Text("Add Money"),
               onPressed: () {
                 new SnackBar(
                   content: new Text("money was added!!"),
                 );
               },
             ),
           )

       
         ],
       )
       
     );
   }
 }
 class MoneyToBank extends StatefulWidget {
   @override
   _MoneyToBankState createState() => _MoneyToBankState();
 }
 
 class _MoneyToBankState extends State<MoneyToBank> {
    List<String> _banks = ['State Bank Of India','Indian bank', "Bank of Maharashtra", 'Banl of Baroda', 'Punjab Natonal Bank', 'IDBI Bank','ICICI Bank','Axis Bank', 'Yes Bank', 'HDFC Bank', 'Bank of Andhra'];
   String _selectBanks;
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.pink,
       appBar: AppBar(
         backgroundColor: Colors.pink,
         title: Text("Send Money To Bank"),
         centerTitle: true,
       ),
       body: Stack(
         children: <Widget>[
           new Container(
                 alignment: Alignment.topCenter,
                 margin: EdgeInsets.fromLTRB(0.0, 250, 0.0, 0.0),
                 child: new DropdownButton(
                   hint: Text("Selet your bank",
                   style: new TextStyle(color: Colors.white),),
                   onChanged: (newValue) {
                     setState(() {
                      _selectBanks =newValue ;
                     });
                   },
                   items: _banks.map((banks){
                     return DropdownMenuItem(child: new Text(banks),
                     value: banks,);
                   }).toList(),
                 ),
               ),
               new Container(
                 alignment: Alignment.topCenter,
                 margin: EdgeInsets.all(20),
                 child: Icon(Icons.account_balance,
                 color: Colors.white,
                 size: 200,),
               ),
                new Container(
             margin: EdgeInsets.all(20),
             alignment: Alignment.centerLeft,
             child: new Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(20, 50, 20, 0.0),
            child: new Theme(
              data: new ThemeData(
                primaryColor: Colors.white,
                primaryColorDark: Colors.amber,

              ),
              child: 
              new TextField(
                
                // controller: _emailController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white,),
                decoration: new InputDecoration(
                  fillColor: Colors.pink,
                  filled:  true,
                  // errorText: _ValidateAmount ? "Email Cannot Be Empty": null,
                  border: new OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.white,

                    ),
                  ),
                  labelText: "Enter the amount to send",
                  labelStyle: new TextStyle(color: Colors.white),
                  helperText: "Ex : 10,000",
                  helperStyle: TextStyle(color: Colors.white),
                  // fillColor: Colors.white,
                  prefixIcon: new Icon(Icons.attach_money,
                  color: Colors.white,),

                ),
              
              ),
            ),
          ),),
          new Container(
             margin: EdgeInsets.all(20),
             alignment: Alignment.centerLeft,
             child: new Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(20, 240, 20, 0.0),
            child: new Theme(
              data: new ThemeData(
                primaryColor: Colors.white,
                primaryColorDark: Colors.amber,

              ),
              child: 
              new TextField(
                
                // controller: _emailController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white,),
                decoration: new InputDecoration(
                  fillColor: Colors.pink,
                  filled: true,
                  // errorText: _ValidateAmount ? "Email Cannot Be Empty": null,
                  border: new OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.white,

                    ),
                  ),
                  labelText: "Enter the Account number",
                  labelStyle: new TextStyle(color: Colors.white),
                  helperText: "Ex : 12300000xxxxx",
                  helperStyle: TextStyle(color: Colors.white),
                  // fillColor: Colors.white,
                  prefixIcon: new Icon(Icons.account_box,
                  color: Colors.white,),

                ),
              
              ),
            ),
          ),),
          new Container(
             margin: EdgeInsets.all(20),
             alignment: Alignment.centerLeft,
             child: new Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(20, 440, 20, 0.0),
            child: new Theme(
              data: new ThemeData(
                primaryColor: Colors.white,
                primaryColorDark: Colors.amber,

              ),
              child: 
              new TextField(
                
                // controller: _emailController,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.white,),
                decoration: new InputDecoration(
                  fillColor: Colors.pink,
                  filled: true,
                  // errorText: _ValidateAmount ? "Email Cannot Be Empty": null,
                  border: new OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.white,

                    ),
                  ),
                  labelText: "Enter the IFSC CODE",
                  labelStyle: new TextStyle(color: Colors.white),
                  helperText: "Ex : for yes bank :- YESB0490xx",
                  helperStyle: TextStyle(color: Colors.white),
                  // fillColor: Colors.white,
                  prefixIcon: new Icon(Icons.code,
                  color: Colors.white,),

                ),
              
              ),
            ),
          ),),
          new Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.all(20),
            child: new RaisedButton(
              child: Text("Send Money"),
              onPressed: () {
                AlertDialog alert = AlertDialog(
                  title: Text("Send money to bank"),
                  content: Text("Money was Sent!!"),
                );
              },
            ),
          )
         ],
       ),
     );
   }
 }

 class AccountSettings extends StatefulWidget {
   @override
   _AccountSettingsState createState() => _AccountSettingsState();
 }
 
 class _AccountSettingsState extends State<AccountSettings> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.brown,
       appBar: AppBar(
         backgroundColor: Colors.brown,
        title: Text("Account Settings"),
        centerTitle: true,
       ),
       body: new Stack(
         children: <Widget>[
           new Container(
             alignment: Alignment.topCenter,
             margin: EdgeInsets.all(20),
             child: Text("Account settings setup",
             style: TextStyle(color: Colors.white,
             fontSize: 20,
             fontWeight: FontWeight.bold),),

           ),

           new Container(
             alignment: Alignment.center,
             margin: EdgeInsets.all(20),
             child: Text("Work in Progress",
             style: TextStyle(color: Colors.white,
             fontSize: 40,
             fontWeight: FontWeight.bold),),
           )
         ],
       ),
       
     );
   }
 }
 class UPI extends StatefulWidget {
   @override
   _UPIState createState() => _UPIState();
 }
 
 class _UPIState extends State<UPI> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.orange,
       appBar: AppBar(
         backgroundColor: Colors.orange,
        title: Text("UPI Options"),
        centerTitle: true,
       ),
       body: new Stack(
         children: <Widget>[
           new Container(
             alignment: Alignment.topCenter,
             margin: EdgeInsets.all(20),
             child: Text("Add UPI Accounts",
             style: TextStyle(color: Colors.white,
             fontSize: 20,
             fontWeight: FontWeight.bold),),

           ),

           new Container(
             alignment: Alignment.center,
             margin: EdgeInsets.all(20),
             child: Text("Work in Progress",
             style: TextStyle(color: Colors.white,
             fontSize: 40,
             fontWeight: FontWeight.bold),),
           )
         ],
       ),
       
     );
   }
 }
 class RecentTransactions extends StatefulWidget {
   @override
   _RecentTransactionsState createState() => _RecentTransactionsState();
 }
 
 class _RecentTransactionsState extends State<RecentTransactions> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.black,
       appBar: AppBar(
         backgroundColor: Colors.black,
        title: Text("Recent transactions"),
        centerTitle: true,
       ),
       body: new Stack(
         children: <Widget>[
           new Container(
             alignment: Alignment.topCenter,
             margin: EdgeInsets.all(20),
             child: Text("Transaction history",
             style: TextStyle(color: Colors.white,
             fontSize: 20,
             fontWeight: FontWeight.bold),),

           ),

           new Container(
             alignment: Alignment.center,
             margin: EdgeInsets.all(20),
             child: Text("Work in Progress",
             style: TextStyle(color: Colors.white,
             fontSize: 40,
             fontWeight: FontWeight.bold),),
           )
         ],
       ),
     );
   }
 }
