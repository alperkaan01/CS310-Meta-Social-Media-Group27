import 'package:cs310_mainproject/Object%20Classes/analytics.dart' as Analytics;
import 'package:cs310_mainproject/Object%20Classes/colors.dart' as color;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../Object Classes/analytics.dart';
class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key,required this.analytics,required this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.AppColor.WelcomeBackground,
        elevation: 1,
        title: Text(
          "Profile Edit",
          style: GoogleFonts.bebasNeue(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
            color: color.AppColor.secondPageContainerGradient2ndColor.withOpacity(0.8),
          ),
        ),
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft,size: 18, color: color.AppColor.secondPageContainerGradient2ndColor,),
          onPressed: (){
            setCurrentScreen(widget.analytics, 'ProfileEdit', 'profileEdit.dart');
          }
        ),
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.gear ,size: 18, color: color.AppColor.secondPageContainerGradient2ndColor,),
            onPressed: (){},
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(child: Container(
            margin: const EdgeInsets.only(top: 170),
            width: size.width-150,
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.pinkAccent.withOpacity(0.5),
                  color.AppColor.gradientSecond.withOpacity(0.8),
                  color.AppColor.SecondMainColor.withOpacity(0.7),
                  Colors.white,
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(400),
              ),
            ),
          ),),
          Positioned(child: Container(
            width: size.width,
            height: 170,
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
              ),
            ),
          )),
          Positioned(
            child: Container(
              width: size.width,
              height: 170,
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
                ),
              ),
            ),
          ),
          Positioned(child: Container(
            padding: const EdgeInsets.only(left: 150,),
            //First give the back part - design
            child: Lottie.network("https://assets4.lottiefiles.com/packages/lf20_acxjjfqm.json",width: 300, height: 250,),
          )),
          Positioned(child: Container(
            alignment: Alignment.bottomLeft,
            child: Stack(
              children: [
                Positioned(child: Container(
                  margin: const EdgeInsets.only(top: 170),
                  width: size.width-160,
                  height: 230,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blueAccent.withOpacity(0.5),
                        Colors.white.withOpacity(0.8),
                        Colors.blue.withOpacity(0.7),
                      ],
                    ),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(400),
                    ),
                  ),
                ),),
                Positioned(child: Container(
                  padding: const EdgeInsets.only(top: 240,),
                  child: Container(
                    child: Lottie.network("https://assets6.lottiefiles.com/private_files/lf30_p36u7dl0.json",width: 150),
                  ),
                ),),
              ],
            ),
          )),
          Positioned(child: Container(
            padding: const EdgeInsets.only(top: 50, left: 15,),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      child: Text(
                        "Innovation",
                        style: GoogleFonts.tajawal(
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://img.freepik.com/free-photo/hipster-head-with-empty-space-3d-render-illustration_1172-983.jpg?w=740",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned( bottom: 390,
                    right: 0,
                    child: Container(
                      height: 50,
                      width: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: color.AppColor.SecondMainColor,
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue,
                            Colors.green,
                          ],
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.edit,color: Colors.white,),
                        onPressed: (){},
                      ),
                )),
              ],
            ),
          )),
          Positioned(child: Container(
            padding: const EdgeInsets.only(top: 230,),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      margin: const EdgeInsets.only(top: 10,),
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Colors.white,
                        ),
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
                            hintText: "userName",
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
                      margin: const EdgeInsets.only(top: 10,),
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Colors.white,
                        ),
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
                        border: Border.all(width: 4, color: Colors.white),
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
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      margin: const EdgeInsets.only(top: 10,),
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Colors.white,
                        ),
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
                            hintText: "Location",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.only(left: 160,),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: FlatButton(
                            onPressed: (){
                              //Navigator push homepage
                            },
                            child: Text("Cancel", style: GoogleFonts.bebasNeue(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),),
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: FlatButton(
                            onPressed: (){
                              //Navigator push homepage
                            },
                            child: Text("Save", style: GoogleFonts.bebasNeue(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
