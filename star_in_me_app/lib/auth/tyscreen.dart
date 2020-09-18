import 'package:flutter/material.dart';

void main(){
  runApp(ThankYou());
}

class ThankYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
            color: Colors.grey,),
            onPressed: null,
          )),
        body: ThankYouPage(),
      )
    );
  }
}

class ThankYouPage extends StatefulWidget {
  @override
  ThankYouPageState createState() {
    return ThankYouPageState();
  }
}

class ThankYouPageState extends State<ThankYouPage> {
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 160.0, 0.0, 0.0),
                  child: Text('Welcome to',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple[500],
                  )),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(140.0, 160.0, 0.0, 0.0),
                  child: Text('The star in me',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[200],
                  )),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(285.0, 160.0, 0.0, 0.0),
                  child: Text(',',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple[500],
                  )),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 190.0, 0.0, 0.0),
                  child: Text('Pratiksha!',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple[500],
                  )),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 230.0, 0.0, 0.0),
                  child: Text('You\'re almost done.',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                  )), 
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 270.0, 0.0, 0.0),
                  child: Text('Thank you for joining. We may reach out to you for ',
                  ), 
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 290.0, 0.0, 0.0),
                  child: Text('additional validation, if required.',
                  ), 
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 330.0, 0.0, 0.0),
                  child: Text('Let us help you create an outstanding profile.',
                  ), 
                ),
                Container(  
                  width: 400,
                    padding: const EdgeInsets.fromLTRB(20.0, 360.0, 20.0, 0.0),  
                    child: new RaisedButton(  
                    child: const Text('START BUILDING YOUR PROFILE '), 
                    color: Colors.deepPurple[500],
                    textColor: Colors.white, 
                    onPressed: ()=>print('Profile'),  
                  )),                  
              ],
            ),
          ),
        ],
      )),
      debugShowCheckedModeBanner: false,
    );  
  }
}