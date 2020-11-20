import 'package:flutter/material.dart';
import 'package:star_in_me_app/authentication/login.dart';
import 'animations/fadeanimations.dart';
import 'package:email_validator/email_validator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:star_in_me_app/screens/thankyou_screen.dart';
import 'package:dropdown_search/dropdown_search.dart';

final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

final String redirectURL = 'https://thestarinme.com/';
final String clientID = '86o6sa1ojxq8qv';
final String clientSecret = 'jBtHgEbOoTb8QN60';

class SignupPage extends StatefulWidget {
  static final String signUpPageId = '/signup';

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameEditingCntroller = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassCOntroller = TextEditingController();
  String firstName, lastName, email, pass, confirmPass, selectedCountry;
  List<String> countries = ["Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bhutan",
    "Bolivia",
    "Bosnia and Herzegovina",
    "Botswana",
    "Brazil",
    "Brunei",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Côte d'Ivoire",
    "Cabo Verde",
    "Cambodia",
    "Cameroon",
    "Canada",
    "Central African Republic",
    "Chad",
    "Chile",
    "China",
    "Colombia",
    "Comoros",
    "Congo (Congo-Brazzaville)",
    "Costa Rica",
    "Croatia",
    "Cuba",
    "Cyprus",
    "Czechia (Czech Republic)",
    "Democratic Republic of the Congo",
    "Denmark",
    "Djibouti",
    "Dominica",
    "Dominican Republic",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Equatorial Guinea",
    "Eritrea",
    "Estonia",
    "Eswatini (fmr. Swaziland)",
    "Ethiopia",
    "Fiji",
    "Finland",
    "France",
    "Gabon",
    "Gambia",
    "Georgia",
    "Germany",
    "Ghana",
    "Greece",
    "Grenada",
    "Guatemala",
    "Guinea",
    "Guinea-Bissau",
    "Guyana",
    "Haiti",
    "Holy See",
    "Honduras",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Ireland",
    "Israel",
    "Italy",
    "Jamaica",
    "Japan",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kiribati",
    "Kuwait",
    "Kyrgyzstan",
    "Laos",
    "Latvia",
    "Lebanon",
    "Lesotho",
    "Liberia",
    "Libya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Madagascar",
    "Malawi",
    "Malaysia",
    "Maldives",
    "Mali",
    "Malta",
    "Marshall Islands",
    "Mauritania",
    "Mauritius",
    "Mexico",
    "Micronesia",
    "Moldova",
    "Monaco",
    "Mongolia",
    "Montenegro",
    "Morocco",
    "Mozambique",
    "Myanmar",
    "Namibia",
    "Nauru",
    "Nepal",
    "Netherlands",
    "New Zealand",
    "Nicaragua",
    "Niger",
    "Nigeria",
    "North Korea",
    "North Macedonia",
    "Norway",
    "Oman",
    "Pakistan",
    "Palau",
    "Palestine State",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Peru",
    "Philippines",
    "Poland",
    "Portugal",
    "Qatar",
    "Romania",
    "Russia",
    "Rwanda",
    "Saint Kitts and Nevis",
    "Saint Lucia",
    "Saint Vincent and the Grenadines",
    "Samoa",
    "San Marino",
    "Sao Tome and Principe",
    "Saudi Arabia",
    "Senegal",
    "Serbia",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "Solomon Islands",
    "Somalia",
    "South Africa",
    "South Korea",
    "South Sudan",
    "Spain",
    "Sri Lanka",
    "Sudan",
    "Suriname",
    "Sweden",
    "Switzerland",
    "Syria",
    "Tajikistan",
    "Tanzania",
    "Thailand",
    "Timor-Leste",
    "Togo",
    "Tonga",
    "Trinidad and Tobago",
    "Tunisia",
    "Turkey",
    "Turkmenistan",
    "Tuvalu",
    "Uganda",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "United States of America",
    "Uruguay",
    "Uzbekistan",
    "Vanuatu",
    "Venezuela",
    "Vietnam",
    "Yemen",
    "Zambia",
    "Zimbabwe"];

  bool showSpinner = false;
  bool _isChecked = false;

  bool _secureText = true;
  void toggle() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FadeAnimation(
          2.0,
          ModalProgressHUD(
              inAsyncCall: showSpinner,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Form(
                        key: _formKey,
                        child: ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  padding:
                                      EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Join ',
                                    style: TextStyle(
                                      fontSize: 21.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepPurple[500],
                                    ),
                                  ),
                                ),
                                Text(
                                  'The Star in me',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple[300],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Checkbox(
                                    value: _isChecked,
                                    tristate: false,
                                    activeColor: Colors.deepPurple,
                                    checkColor: Colors.white,
                                    onChanged: (bool isChecked) {
                                      setState(() {
                                        _isChecked = isChecked;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Yes, I am female',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            DropdownSearch<String>(
                              hint:"Please select your country",
                              mode: Mode.MENU,
                              showSelectedItem: true,
                              items: countries,
                              onChanged: (value) => setState(() {
                                selectedCountry = value;
                                print(selectedCountry);
                              }),
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: ButtonTheme(
                                    height: 40.0,
                                    minWidth: 10.0,
                                    padding:
                                        EdgeInsets.only(left: 5.0, right: 5.0),
                                    child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        splashColor: Colors.lightBlue,
                                        elevation: 10.0,
                                        highlightElevation: 50.0,
                                        child: Row(children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 5.0),
                                            // child: Image.asset(
                                            //   'images/linkedin_logo.png',
                                            //   height: 40.0,
                                            //   width: 15.0,
                                            // ),
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              child: Text('in',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.deepPurple[500],
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              )),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.rectangle,
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                            ),
                                          ),
                                          Text('Sign up with LinkedIn'),
                                        ]),
                                        color: Colors.deepPurple[500],
                                        textColor: Colors.white,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LinkedInUserWidget(
                                                        redirectUrl:
                                                            redirectURL,
                                                        clientId: clientID,
                                                        clientSecret:
                                                            clientSecret,
                                                        onGetUserProfile:
                                                            (LinkedInUserModel
                                                                linkedInUser) {
                                                          print(
                                                              'Access token ${linkedInUser.token.accessToken}');
                                                          print(
                                                              'First name: ${linkedInUser.firstName.localized.label}');
                                                          print(
                                                              'Last name: ${linkedInUser.lastName.localized.label}');
                                                        },
                                                        catchError:
                                                            (LinkedInErrorObject
                                                                error) {
                                                          print(
                                                              'Error description: ${error.description},'
                                                              ' Error code: ${error.statusCode.toString()}');
                                                        },
                                                      )));
                                        }),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: ButtonTheme(
                                    height: 40.0,
                                    minWidth: 10.0,
                                    padding:
                                        EdgeInsets.only(left: 5.0, right: 5.0),
                                    child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        splashColor: Colors.red,
                                        // elevation: 10.0,
                                        // highlightElevation: 50.0,
                                        child: Row(children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0, right: 5.0),
                                            // child: Image.asset(
                                            //   'images/google_logo.png',
                                            //   height: 40.0,
                                            //   width: 15.0,
                                            // ),
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              child: Text('G',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.deepPurple[500],
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  )),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.rectangle,
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                            ),
                                          ),
                                          Text('Sign up with Google'),
                                        ]),
                                        color: Colors.deepPurple[500],
                                        textColor: Colors.white,
                                        onPressed: () async {
                                          User user;
                                          try {
                                             user =
                                                await _signUpWithGoogle();
                                          } on FirebaseAuthException catch (e) {
                                            print('${e.code}');
                                          } catch (e) {
                                            print(e.toString());
                                          }

                                          Navigator.pushNamed(
                                              context, ThankYou.thankYouPage,arguments: {'name':user.displayName});
                                        }),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            getSeparateDivider(),
                            SizedBox(height: 10.0),
                            TextFormField(
                              enableSuggestions: true,
                              controller: firstNameController,
                              keyboardType: TextInputType.text,
                              keyboardAppearance: Brightness.dark,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Enter Your Name";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                firstName = value;
                              },
                              decoration: InputDecoration(
                                labelText: "First Name",
                                border: const OutlineInputBorder(),
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                focusedBorder:
                                OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(
                                      Radius.circular(
                                          10)),
                                  borderSide: new BorderSide(
                                      width: 1,
                                      color: Colors.deepPurple),
                                ),
                                enabledBorder:
                                OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(
                                      Radius.circular(
                                          10)),
                                  borderSide: new BorderSide(
                                      width: 1,
                                      color:
                                      Colors.grey),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              enableSuggestions: true,
                              controller: lastNameEditingCntroller,
                              keyboardType: TextInputType.text,
                              keyboardAppearance: Brightness.dark,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Enter Your Surname";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                lastName = value;
                              },
                              decoration: InputDecoration(
                                labelText: "Last Name",
                                border: const OutlineInputBorder(),
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                focusedBorder:
                                OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(
                                      Radius.circular(
                                          10)),
                                  borderSide: new BorderSide(
                                      width: 1,
                                      color: Colors.deepPurple),
                                ),
                                enabledBorder:
                                OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(
                                      Radius.circular(
                                          10)),
                                  borderSide: new BorderSide(
                                      width: 1,
                                      color:
                                      Colors.grey),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              enableSuggestions: true,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              keyboardAppearance: Brightness.dark,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Enter your Email ID";
                                } else if (!EmailValidator.validate(value)) {
                                  return "Enter a Valid Email ID";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                email = value;
                              },
                              decoration: InputDecoration(
                                labelText: "Email Address",
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                focusedBorder:
                                OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(
                                      Radius.circular(
                                          10)),
                                  borderSide: new BorderSide(
                                      width: 1,
                                      color: Colors.deepPurple),
                                ),
                                enabledBorder:
                                OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(
                                      Radius.circular(
                                          10)),
                                  borderSide: new BorderSide(
                                      width: 1,
                                      color:
                                      Colors.grey),
                                ),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              controller: passController,
                              decoration: InputDecoration(
                                labelText: "New Password (Min 6 Characters)",
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                focusedBorder:
                                OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(
                                      Radius.circular(
                                          10)),
                                  borderSide: new BorderSide(
                                      width: 1,
                                      color: Colors.deepPurple),
                                ),
                                enabledBorder:
                                OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(
                                      Radius.circular(
                                          10)),
                                  borderSide: new BorderSide(
                                      width: 1,
                                      color:
                                      Colors.grey),
                                ),
                                suffixIcon: FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        toggle();
                                      });
                                    },
                                  child: _secureText
                                      ? Icon(
                                      Icons
                                          .visibility_off,
                                      color: Colors.grey
                                          .withOpacity(
                                          0.5))
                                      : Icon(
                                      Icons
                                          .remove_red_eye,
                                      color: Colors.grey
                                          .withOpacity(
                                          0.5)),
                                ),
                                border: const OutlineInputBorder(),
                              ),
                              validator: (value) => value.length < 6
                                  ? 'Password too short.'
                                  : null,
                              onChanged: (value) {
                                pass = value;
                              },
                              obscureText: _secureText,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              controller: confirmPassCOntroller,
                              decoration: InputDecoration(
                                labelText: "Confirm Password",
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                focusedBorder:
                                OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(
                                      Radius.circular(
                                          10)),
                                  borderSide: new BorderSide(
                                      width: 1,
                                      color: Colors.deepPurple),
                                ),
                                enabledBorder:
                                OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(
                                      Radius.circular(
                                          10)),
                                  borderSide: new BorderSide(
                                      width: 1,
                                      color:
                                      Colors.grey),
                                ),
                                suffixIcon: FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        toggle();
                                      });
                                    },
                                  child: _secureText
                                      ? Icon(
                                      Icons
                                          .visibility_off,
                                      color: Colors.grey
                                          .withOpacity(
                                          0.5))
                                      : Icon(
                                      Icons
                                          .remove_red_eye,
                                      color: Colors.grey
                                          .withOpacity(
                                          0.5)),
                                ),
                                border: const OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value.length < 6) {
                                  return "Password too short";
                                } else if (confirmPass != pass) {
                                  return "Passwords do not match";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                confirmPass = value;
                              },
                              obscureText: _secureText,
                            ),
                            SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Row(children: <Widget>[
                                Text(
                                  'By signing up, I agree to the ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Text('terms and conditions',
                                    style: TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                    )),
                              ]),
                            ),
                            SizedBox(height: 15),
                            Container(
                                height: 40,
                                width: double.infinity,
                                padding: const EdgeInsets.only(
                                    left: 5.0, right: 5.0),
                                child: new RaisedButton(
                                  splashColor: Colors.lightBlueAccent,
                                  elevation: 10.0,
                                  highlightElevation: 30.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Text('SIGN UP NOW'),
                                  color: Colors.deepPurple[500],
                                  textColor: Colors.white,
                                  onPressed: () async {
                                    bool isUser;
                                    UserCredential userCredential;
                                    if (_formKey.currentState.validate()) {
                                      setState(() {
                                        showSpinner = true;
                                      });

                                      try {
                                        userCredential = await _auth
                                            .createUserWithEmailAndPassword(
                                                email: email, password: pass);
                                        if (userCredential != null) {
                                          _firestore.collection("users").add({
                                            "firstName": firstName,
                                            "lastName": lastName,
                                            "email": email
                                          });
                                        }
                                      } on FirebaseAuthException catch (e) {
                                        if (e.code == 'weak-password') {
                                          print("${e.code}");
                                        } else if (e.code ==
                                            'email-already-in-use') {
                                          print("${e.code}");
                                          isUser = true;
                                        }
                                      } catch (e) {
                                        print(e.toString());
                                      } finally {
                                        setState(() {
                                          showSpinner = false;
                                        });
                                        if (isUser) {
                                          Navigator.pushNamed(
                                              context, ThankYou.thankYouPage);
                                        }
                                      }

                                      if (userCredential != null) {
                                        Navigator.pushNamed(
                                            context, SignupPage.signUpPageId);
                                      }
                                    }
                                  },
                                )),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Already have an account on ',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    'The Star in me? ',
                                    style: TextStyle(
                                        color: Colors.purple[300],
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Material(
                                    color: Colors.white.withOpacity(0.0),
                                    child: InkWell(
                                      child: Text('Log in',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.deepPurple[500])),
                                      onTap: () => Navigator.pushNamed(
                                          context, LoginPage.loginPageId),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))),
              )),
        ),
      ),
    );
  }
}

Future<User> _signUpWithGoogle() async {
  bool isSignedIn = await googleSignIn.isSignedIn();
  print(isSignedIn);
  if (isSignedIn) {
    final user = _auth.currentUser;
    return user;
  } else {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    final result = await _auth.signInWithCredential(credential);
    final User user = result.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final currentUser = _auth.currentUser;
    assert(currentUser.uid == user.uid);

    _firestore.collection("users").doc(currentUser.email).set({
      "name": currentUser.displayName, "email": currentUser.email
    });
    print(currentUser.email);

    return user;
  }
}

//Horizontal lIne

class Drawhorizontalline extends CustomPainter {
  Paint _paint;
  bool reverse;

  Drawhorizontalline(this.reverse) {
    _paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (reverse) {
      canvas.drawLine(Offset(-250.0, 0.0), Offset(-10.0, 0.0), _paint);
    } else {
      canvas.drawLine(Offset(10.0, 0.0), Offset(250.0, 0.0), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

Widget getSeparateDivider() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      CustomPaint(painter: Drawhorizontalline(true)),
      Text(
        "OR",
        style: TextStyle(
            color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 10.0),
      ),
      CustomPaint(painter: Drawhorizontalline(false))
    ],
  );
}
