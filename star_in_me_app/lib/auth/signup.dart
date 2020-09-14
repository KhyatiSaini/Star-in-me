import 'package:flutter/material.dart';

void main() {
  runApp(SignUp());
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: SignUpPage(),
    ));
  }
}

class SignUpPage extends StatefulWidget {
  @override
  SignUpPageState createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  // final _formKey = 
  bool _isChecked = false;

  Widget build(BuildContext context) {
    return Form(
      // key: _formKey,
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start,  
        children: <Widget>[
            Container(  
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    child: Text('Join',
                      style: TextStyle(
                        fontSize: 21.0, 
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple[500],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(55.0, 0.0, 0.0, 0.0),
                    child: Text('The Star in me',
                      style: TextStyle(
                        fontSize: 20.0, 
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[300],
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                      child: Checkbox(
                        value: _isChecked,
                        tristate: false,
                        onChanged: (bool isChecked) {
                          setState(() {
                          _isChecked = isChecked;
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                    // drop down list to select country
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(45.0, 40.0, 0.0, 0.0),
                    child: Text('Yes, I am female',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Container(  
                    padding: const EdgeInsets.fromLTRB(10.0, 100.0, 0.0, 0.0),  
                    child: new RaisedButton(  
                    child: const Text('Sign up with LinkedIn'), 
                    color: Colors.deepPurple[500],
                    textColor: Colors.white, 
                    onPressed: ()=>print('Sign up with LinkedIn clicked'),  
                  )),
                  Container(  
                    padding: const EdgeInsets.fromLTRB(195.0, 100.0, 0.0, 0.0),  
                    child: new RaisedButton(  
                    child: const Text('Sign up with Google'), 
                    color: Colors.deepPurple[500],
                    textColor: Colors.white, 
                    onPressed: ()=>print('Sign up with Google clicked'),  
                  )), 
                  Container(
                    padding: const EdgeInsets.fromLTRB(10.0, 160.0, 0.0, 0.0),
                    child: Container(
                    height: 1.0,
                    width: 160.0,
                    color: Colors.grey,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(175.0, 155.0, 0.0, 0.0),
                    child: Text('OR',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(195.0, 160.0, 0.0, 0.0),
                    child: Container(
                    height: 1.0,
                    width: 160.0,
                    color: Colors.grey,
                    ),
                  ), 
                ],
              ),
            ),   
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
            children: <Widget>[
                SizedBox(height: 8,),
                TextField(
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                  isDense: true,
                  ),
                ),
                SizedBox(height: 8,),
                TextField(
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                  isDense: true,                      
                  ),
                ),
                SizedBox(height: 8,),
                TextField(
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email Address',
                  isDense: true,                      
                  // contentPadding: EdgeInsets.all(8),  
                  ),
                ),
                SizedBox(height: 8,),
                TextField(
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'New Password (Min 6 Characters)',
                  isDense: true,                      
                  // contentPadding: EdgeInsets.all(8),  
                  ),
                ),
                SizedBox(height: 8,),
                TextField(
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                  isDense: true,                      
                  // contentPadding: EdgeInsets.all(8),  
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5.0),
            child: Stack(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    child: Text('By signing up, I agree to the ',
                    style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.grey,
                    ),
                  ),
                ),  
                Container(
                    padding: EdgeInsets.fromLTRB(172.0, 0.0, 0.0, 0.0),
                    child: Text('terms and conditions.',
                    style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(  
              width: double.infinity, 
              padding: const EdgeInsets.all(8.0),  
              child: new RaisedButton(  
                  child: const Text('SIGN UP NOW'), 
                  color: Colors.deepPurple[500],
                  textColor: Colors.white, 
                  onPressed: ()=>print('Sign up'),  
            )
          ),
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    child: Text('Already have an account on ',
                    style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                    ),
                  ),
                ),  
                Container(
                    padding: EdgeInsets.fromLTRB(197.0, 0.0, 0.0, 0.0),
                    child: Text('The star in me',
                    style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.purple[300],
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(294.0, 0.0, 0.0, 0.0),
                    child: Text('?',
                    style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(304.0, 0.0, 0.0, 0.0),
                    child: Text('Log in',
                    style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple[500],
                    ),
                  ),
                ),
              ],
            ),
          ),  
        ],  
      ), 
    );
  }
}