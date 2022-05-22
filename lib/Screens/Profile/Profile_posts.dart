import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/styles/colors.dart' as color;

class Profile_posts extends StatefulWidget {
  const Profile_posts({Key? key}) : super(key: key);

  @override
  State<Profile_posts> createState() => _Profile_postsState();
}

class _Profile_postsState extends State<Profile_posts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Positioned(
                          child: Container(
                            //width: size.width,
                            height: 330,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  color.AppColor.gradientFirst.withOpacity(0.5),
                                  color.AppColor.gradientSecond.withOpacity(0.8),
                                  color.AppColor.SecondMainColor.withOpacity(0.7),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(100),
                                bottomLeft: Radius.circular(100),
                              ),
                            ),
                          )
                      ),
                      Positioned(
                        child:Container(
                          padding: EdgeInsets.only(top: 13.0, left: 325.0),
                          child: IconButton(
                              onPressed:() {},
                              icon: Icon(
                                Icons.edit, color: Colors.black,)),
                        ),),
                      Positioned(child: Center(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 20),
                              child: Image.asset('lib/assets/images/avatar.png'),
                              height: 190,
                              width: 200,
                            ),
                            Text(
                              "Name Surname",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "@username",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Posts",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),

                                    Text(
                                      "23",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(width: 25),
                                Column(
                                  children: [
                                    Text(
                                      "Followers",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Text(
                                      "570",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 25,),
                                Column(
                                  children: [
                                    Text(
                                      "Following",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Text(
                                      "642",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )

                              ],
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 40,
                        decoration: BoxDecoration(
                          color: color.AppColor.SecondMainColor,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: FlatButton(
                          onPressed: (){
                            //Navigator push homepage
                          },
                          child: Text("Posts", style: TextStyle(
                            color: Colors.black,
                          ),),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        width: 70,
                        height: 40,
                        decoration: BoxDecoration(
                          color: color.AppColor.SecondMainColorOpaque,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: FlatButton(
                          onPressed: (){
                            //Navigator push homepage
                          },
                          child: Text("NFT", style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                          ),),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: color.AppColor.gradientSecond,
                    thickness: 1.2,

                  ),
                  SizedBox(height: 216),
                ],
              )
            ],
          ),
        )
    );
  }
}

