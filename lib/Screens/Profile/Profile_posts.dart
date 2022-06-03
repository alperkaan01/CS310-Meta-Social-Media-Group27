import 'package:cs310_mainproject/Screens/ProfileEdit/profileEdit.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import '../../Object Classes/colors.dart' as color;
import '../../Object Classes/nft.dart';
import '../../Object Classes/post.dart';
import '../../UI/nftcard.dart';
import '../../UI/postcard.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key, required this.analytics,required this.observer }) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Post> posts = [
    Post( URL: "https://www.animalfriends.co.uk/siteassets/media/images/article-images/cat-articles/38_afi_article1_caring-for-a-kitten-tips-for-the-first-month.png",text: 'Hello MetaWorld 1', date: 'March 31', likes: 10, comments: 0,UserURL: 'https://support.signal.org/hc/article_attachments/360083910451/animated-2.gif' ,username: 'User62'),
    Post( URL: "https://kitcheninred.com/wp-content/uploads/2020/06/%C3%A7ikolatal%C4%B1-pasta-1-scaled.jpg",text: 'Hello MetaWorld 2', date: 'March 30', likes: 0, comments: 5,UserURL: 'https://support.signal.org/hc/article_attachments/360083910451/animated-2.gif' ,username: 'User62'),
    Post( URL: "https://i.pinimg.com/originals/62/f1/65/62f165cebd814ec81f1e5a324eecbdd1.jpg", text: 'Hello MetaWorld 3', date: 'March 29', likes: 20, comments: 10,UserURL: 'https://support.signal.org/hc/article_attachments/360083910451/animated-2.gif' ,username: 'User62'),
  ];
  List<NFT> nfts = [
    NFT( URL: "https://jingculturecommerce.com/wp-content/uploads/2021/11/rtfkt-murakami-clone-x-2-1240x826.jpg", UserURL: 'https://support.signal.org/hc/article_attachments/360083910451/animated-2.gif' ,text: 'Hello MetaWorld 1', date: 'March 31', likes: 10, money: 1000,username: 'User62'),
    NFT( URL: "https://www.presse-citron.net/app/uploads/2022/03/bored-ape-metavers-yuga-labs.jpg",UserURL: 'https://support.signal.org/hc/article_attachments/360083910451/animated-2.gif' ,text: 'Hello MetaWorld 2', date: 'March 30', likes: 0, money: 750,username: 'User62'),
    NFT( URL: "https://cryptopotato.com/wp-content/uploads/2022/01/img3_cryptopunks.jpg", UserURL: 'https://support.signal.org/hc/article_attachments/360083910451/animated-2.gif', text: 'Hello MetaWorld 3', date: 'March 29', likes: 20, money: 600,username: 'User93'),
  ];
  bool selectedPost = true;
  int currentIndex = 0;


  void deletePost(Post post) {
    setState(() {
      posts.remove(post);
    });
  }
  void deleteNFT(NFT nft) {
    setState(() {
      nfts.remove(nft);
    });
  }

  void LikeIncrement(Post post) {
    setState(() {
      post.likes++;
    });
  }
  void LikeIncrementNFT(NFT nft) {
    setState(() {
      nft.likes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
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
      Column(
        children: nfts.map((nft) => NFTCard(
          nft: nft,
          delete: (){
            deleteNFT(nft);
          },
          likeIncrement: (){
            LikeIncrementNFT(nft);
          },
        )).toList(),
      ),



    ];
    return SingleChildScrollView(
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
                                  color.AppColor.gradientSecond.withOpacity(
                                      0.8),
                                  color.AppColor.SecondMainColor.withOpacity(
                                      0.7),
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
                        child: Container(
                          padding: EdgeInsets.only(top: 13.0, left: 325.0),
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return ProfileEdit( analytics: widget.analytics, observer: widget.observer,);
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
                          color: selectedPost ? color.AppColor.SecondMainColor:color.AppColor.SecondMainColorOpaque,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              currentIndex = 0;
                              selectedPost = true;
                            });
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
                          color:  selectedPost ? color.AppColor.SecondMainColorOpaque:color.AppColor.SecondMainColor,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              currentIndex = 1;
                              selectedPost = false;
                            });
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
                  screens[currentIndex],
                ],
              ),
            ],
          ),

    );
  }
}
