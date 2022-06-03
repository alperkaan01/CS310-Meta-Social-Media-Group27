import 'dart:io';

import 'package:cs310_mainproject/Object%20Classes/analytics.dart';
import 'package:cs310_mainproject/Object%20Classes/auth.dart';
import 'package:cs310_mainproject/Screens/HomePage/Homepage.dart';
import 'package:cs310_mainproject/Screens/SignUp/Signup.dart';
import 'package:cs310_mainproject/Object%20Classes/colors.dart' as color;
import 'package:email_validator/email_validator.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.analytics, required this.observer }) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  late String username;
  late String name;
  late String password;
  late String email;
  late String surname;
  final _formKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService(); //For firebase authentication



  Future LoginUser() async {
    dynamic result =await  _auth.SignInWithEmailPass(email, password);
    if(result is String){
      _showDialog('Login Error', result);

    }else if(result is User){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return HomePage(analytics: widget.analytics, observer: widget.observer,);
      }));
      
    }
    else{
      _showDialog('Login error', result.toString());
    }
  } // Email or password try catch block for Login

  @override
  void initState() {
    super.initState();



  }


  Future<void> _showDialog(String title, String message) async {
    bool isAndroid = Platform.isAndroid;
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          if (isAndroid) {
            return AlertDialog(
              title: Text(title,style: GoogleFonts.bebasNeue(
                  fontSize: 25,color: Colors.blue

              ),),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text(message,style: GoogleFonts.montserrat(
                      fontSize: 16,

                    )),
                  ],
                ),

              ),
              actions: [
                TextButton(
                  child:  Text('OK',style: GoogleFonts.bebasNeue(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          }
          else {
            return CupertinoAlertDialog(
              title: Text(title,style: GoogleFonts.bebasNeue(
                  fontSize: 25,color: Colors.blue

              ),),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text(message,style: GoogleFonts.montserrat(
                      fontSize: 16,

                    )),
                  ],
                ),

              ),
              actions: [
                TextButton(
                  child: Text('OK',style: GoogleFonts.bebasNeue(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )

              ],

            );
          }
        });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Stack(
                      children:[
                        Positioned(
                          child: Container(
                            width: size.width,
                            height: 400,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  color.AppColor.gradientFirst.withOpacity(0.5),
                                  color.AppColor.gradientSecond.withOpacity(0.8),
                                  color.AppColor.SecondMainColor.withOpacity(0.7),
                                ],
                              ),
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(100),
                                bottomLeft: Radius.circular(100),
                              ),
                            ),
                          ),
                        ),
                        Positioned(child: Container(
                          child: Lottie.network("https://assets1.lottiefiles.com/packages/lf20_jcikwtux.json"),
                        )),
                      ],
                    ),
                    Stack(
                      children: [
                        Positioned(child: Container(
                          height: 270,
                          width: size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(300),
                            ),
                          ),
                        )),
                        Positioned(child: Container(
                          height: 270,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue.withOpacity(0.4),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(500),
                            ),
                          ),
                        )),
                        Positioned(child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Container(
                                margin: const EdgeInsets.only(top: 10,),
                                height: 50,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      color.AppColor.gradientFirst.withOpacity(0.5),
                                      color.AppColor.gradientSecond.withOpacity(0.8),
                                      color.AppColor.SecondMainColor.withOpacity(0.7),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child:  Padding(
                                  padding: EdgeInsets.only(left: 25,),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "E-mail",
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    validator: (value){
                                      if(value != null) {
                                        if (value.isEmpty) {
                                          return "Please enter your email";
                                        }
                                        if (!EmailValidator.validate(value)) {
                                          return 'Please enter a valid e-mail address';
                                        }

                                      }
                                    },
                                    onSaved: (value){
                                      email =  value ?? '';

                                    },

                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      color.AppColor.gradientFirst.withOpacity(0.5),
                                      color.AppColor.gradientSecond.withOpacity(0.8),
                                      color.AppColor.SecondMainColor.withOpacity(0.7),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child:  Padding(
                                  padding: EdgeInsets.only(left: 25,),
                                  child: TextFormField(
                                    obscureText: true,

                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    validator: (value){
                                      if(value != null) {
                                        if (value.isEmpty) {
                                          return "Please enter your password";
                                        }
                                        if(value.length < 6){
                                          return 'Password too short';
                                        }

                                      }
                                    },
                                    onSaved: (value){
                                      password =  value ?? '';


                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10,),
                              width: size.width - 50,
                              decoration: BoxDecoration(
                                color: color.AppColor.gradientFirst.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: FlatButton(
                                onPressed: () async {
                                  //Navigator push homepage
                                  if(_formKey.currentState!.validate()){

                                    _formKey.currentState!.save();
                                    await LoginUser();
                                    //Navigator push login
                                    logLogin(widget.analytics);
                                    //Navigator.push(context, MaterialPageRoute(builder: (context){
                                    //return HomePage();
                                    //}));
                                  }
                                  else{
                                    _showDialog('Form Error', '-Your form is invalid-');


                                  }


                                },
                                child: Text("Login", style: GoogleFonts.bebasNeue(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),),
                              ),
                            ),
                            Container(
                              //color: Colors.black,
                              width: size.width,
                              padding: const EdgeInsets.symmetric(horizontal: 100,),
                              child: Row(
                                children: [
                                  const Text("Not a member yet?"),
                                  Container(
                                    width: MediaQuery.of(context).size.width - 320,
                                    child: FlatButton(
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context){
                                          return SignUp(analytics: widget.analytics,observer: widget.observer,);
                                        }));
                                      },
                                      child: const Text("Register Now", style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 135,),
                              child: Row(
                                children: [
                                  const Icon(Icons.facebook, size: 45, color: Colors.blueAccent,),
                                  const SizedBox(width: 15,),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const Icon(FontAwesomeIcons.google, size: 18, color: Colors.white,),
                                  ),
                                  const SizedBox(width: 15,),
                                  const Icon(FontAwesomeIcons.twitterSquare, size: 37, color: Colors.blueAccent,),
                                ],
                              ),
                            )
                          ],
                        )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
