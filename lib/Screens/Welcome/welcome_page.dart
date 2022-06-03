import 'package:cs310_mainproject/Screens/Login/Login.dart';
import 'package:cs310_mainproject/Screens/SignUp/Signup.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:cs310_mainproject/Object%20Classes/colors.dart' as color;
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key, required this.analytics, required this.observer }) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10,),
            child: Lottie.network(
                "https://assets4.lottiefiles.com/packages/lf20_clujqcpl.json",
                width: size.width,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 75, left: 50, right: 50),
            child: Column(
              children: [
                Container(
                  width: 300,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: FlatButton(
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40,),
                      color: color.AppColor.SecondMainColor,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){ return SignUp(analytics: analytics,observer: observer,); } ));
                      }, //Add navigator --> Walkthrough
                      child: Text("Sign-Up", style: GoogleFonts.bebasNeue(fontSize: 25, color: Colors.white),),
                    ),
                  ),
                ),
                const SizedBox(height: 11.4,),
                Container(
                  width: 300,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: FlatButton(
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40,),
                      color: color.AppColor.LoginColor,
                      onPressed: (){Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context){
                            return Login(analytics: analytics, observer: observer,);
                          }
                          )
                      );
                      },
                      child: Text("Login", style: TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.5)),),
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

//This page consist of the navigators for login and Sign-up page
