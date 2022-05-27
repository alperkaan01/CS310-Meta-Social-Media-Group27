import 'package:cs310_mainproject/Screens/HomePage/Homepage.dart';
import 'package:cs310_mainproject/Screens/SignUp/Signup.dart';
import 'package:cs310_mainproject/Object%20Classes/colors.dart' as color;
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
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
                              child: const Padding(
                                padding: EdgeInsets.only(left: 25,),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "E-mail",
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
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
                              child: const Padding(
                                padding: EdgeInsets.only(left: 25,),
                                child: TextField(
                                  obscureText: true,

                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
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
                              onPressed: (){
                                //Navigator push homepage
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return HomePage();
                                }));
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
                                        return SignUp();
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
    );
  }
}
