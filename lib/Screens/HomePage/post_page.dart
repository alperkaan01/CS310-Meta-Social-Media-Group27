import 'package:cs310_mainproject/Screens/Login/Login.dart';
import 'package:cs310_mainproject/Screens/Welcome/welcome_page.dart';
import 'package:cs310_mainproject/UI/postcard.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

import '../../Object Classes/auth.dart';
import '../../Object Classes/colors.dart';
import '../../Object Classes/post.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key, required this.analytics, required this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Post> posts = [
    Post( URL: "https://www.animalfriends.co.uk/siteassets/media/images/article-images/cat-articles/38_afi_article1_caring-for-a-kitten-tips-for-the-first-month.png",text: 'Hello MetaWorld 1', date: 'March 31', likes: 10, comments: 0,UserURL: 'https://support.signal.org/hc/article_attachments/360083910451/animated-2.gif' ,username: 'User62'),
    Post( URL: "https://kitcheninred.com/wp-content/uploads/2020/06/%C3%A7ikolatal%C4%B1-pasta-1-scaled.jpg",text: 'Hello MetaWorld 2', date: 'March 30', likes: 0, comments: 5,UserURL: 'https://support.signal.org/hc/article_attachments/360083910451/animated-2.gif' ,username: 'User62'),
    Post( URL: "https://i.pinimg.com/originals/62/f1/65/62f165cebd814ec81f1e5a324eecbdd1.jpg", text: 'Hello MetaWorld 3', date: 'March 29', likes: 20, comments: 10,UserURL: 'https://support.signal.org/hc/article_attachments/360083910451/animated-2.gif' ,username: 'User62'),
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
  int currentColor = 0;
  final colors = [
    Colors.lightBlueAccent,
    Colors.greenAccent,

    AppColor.WelcomeBackground,
    AppColor.SecondMainColor,
    Colors.red,
    Colors.yellow,

  ];
  void colorChange() {
    setState(() {
      if (currentColor < 5) {
        currentColor = currentColor + 1;
      }
      else {
        currentColor = 0;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final AuthService _auth = AuthService();

    return SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Container(
                  padding: const EdgeInsets.only(top: 25, left: 10,),
                  child: FloatingActionButton(onPressed: () async {
                    await _auth.signOut();
                    Navigator.pop(context, MaterialPageRoute(builder: (context){
                      return WelcomeScreen(analytics: widget.analytics, observer: widget.observer,);
                    }));
                  },
                    backgroundColor: colors[currentColor],
                    child: const Icon(Icons.logout,color: Colors.black,)
                    ,),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 25, right: 10,),
                  child: FloatingActionButton(onPressed: colorChange,
                    backgroundColor: colors[currentColor],
                    child: const Icon(Icons.format_paint,color: Colors.black,),),
                )
              ],
            ),
            Stack(
              children: [
                Positioned(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: CircleAvatar(
                            backgroundColor: colors[currentColor],
                            child: ClipOval(
                              child: Image.network(
                                'https://support.signal.org/hc/article_attachments/360083910451/animated-2.gif',
                                fit: BoxFit.cover,
                              ),
                            ),
                            radius: 70,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(child: const Center(child: Text("@Username",
                          style: TextStyle(fontSize: 20),)),

                            width: 150,
                            height: 30,
                            decoration: BoxDecoration(
                              color: colors[currentColor],

                              borderRadius:  BorderRadius.circular(50),
                            )
                        ),
                        const SizedBox(height: 40,),



                      ],
                    ),
                  ],
                ),),

              ],
            ),
            Stack(
              children: [
                Positioned(
                  child: Container(
                    padding: const EdgeInsets.only(top: 50,),
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                      color: colors[currentColor],

                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),
                  ),
                ),
                Positioned(child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 240,
                            height: 25,
                            decoration:  BoxDecoration(
                              color: Colors.white,

                              borderRadius:  BorderRadius.circular(50),
                            ),
                            child: const Center(
                              child: Text('Post Page', style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Column(
                      children: posts.map((post) =>
                          PostCard(
                            post: post,
                            delete: () {
                              deletePost(post);
                            },
                            likeIncrement: () {
                              LikeIncrement(post);
                            },
                          )).toList(),
                    ),
                  ],
                )
                ),

              ],
            )
          ],
        ),
      );

  }
}

