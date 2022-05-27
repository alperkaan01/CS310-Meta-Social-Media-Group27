import 'package:cs310_mainproject/Object%20Classes/colors.dart' as color;
import 'package:cs310_mainproject/Object%20Classes/post.dart';
import 'package:cs310_mainproject/Screens/ProfileEdit/profileEdit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../UI/postcard.dart';

class Profile_posts extends StatefulWidget {
  const Profile_posts({Key? key}) : super(key: key);

  @override
  State<Profile_posts> createState() => _Profile_postsState();
}

class _Profile_postsState extends State<Profile_posts> {

  List<Post> posts = [
    Post( URL: "https://jingculturecommerce.com/wp-content/uploads/2021/11/rtfkt-murakami-clone-x-2-1240x826.jpg",text: 'Hello MetaWorld 1', date: 'March 31', likes: 10, comments: 0),
    Post( URL: "https://www.presse-citron.net/app/uploads/2022/03/bored-ape-metavers-yuga-labs.jpg",text: 'Hello MetaWorld 2', date: 'March 30', likes: 0, comments: 5),
    Post( URL: "https://cryptopotato.com/wp-content/uploads/2022/01/img3_cryptopunks.jpg", text: 'Hello MetaWorld 3', date: 'March 29', likes: 20, comments: 10),
  ];

  void deletePost(Post post) {
    setState(() {
      posts.remove(post);
    });
  }

  void LikeIncrement(Post post) {
    setState(() {
      post.likes++;
    });
  }

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
                              onPressed:() {
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return ProfileEdit();
                                }));
                              },
                              icon: const Icon(
                                Icons.edit, color: Colors.black,)),
                        ),),
                      Positioned(child: Center(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 20),
                              child: Image.asset('assets/images/avatar.png'),
                              height: 190,
                              width: 200,
                            ),
                            const Text(
                              "Name Surname",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
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
                                  children: const [
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
                                  children: const [
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
                                  children: const [
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
                  Column(
                    children: posts.map((post) => PostCard(
                      post: post,
                      delete: (){
                        deletePost(post);
                      },
                      likeIncrement: (){
                        LikeIncrement(post);
                      },
                    )).toList(),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
