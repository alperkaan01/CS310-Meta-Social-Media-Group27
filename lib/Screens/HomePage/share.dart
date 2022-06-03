import 'package:cs310_mainproject/Screens/HomePage/shareNFT.dart';
import 'package:cs310_mainproject/Screens/HomePage/sharePost.dart';
import 'package:flutter/material.dart';


class SharePage extends StatefulWidget {
  const SharePage({Key? key}) : super(key: key);

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  int currentIndex =0;
  bool selectedPost = true;
  final screens  = [
    SharePost(),
    ShareNFT(),

  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: [

            Stack(
              children: [
                Positioned(
                    child: Container(
                      //width: size.width,
                      height: 130,
                      decoration: const BoxDecoration(
                        color:Colors.lightBlueAccent,

                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),

                        ),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(

                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Share',style: TextStyle(
                                    fontSize: 30,color: Colors.white
                                ),)
                              ],
                            ),
                            Row(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 140,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: selectedPost ? Colors.black : Colors.black54,

                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedPost = true;
                                        currentIndex = 0;
                                      });
                                    },
                                    child: Text("Posts", style: TextStyle(fontSize: 20,
                                      color: Colors.white,
                                    ),),
                                  ),
                                ),
                                SizedBox(width: 50,),

                                Container(
                                  width: 140,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color:selectedPost ? Colors.black54 : Colors.black,

                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedPost =false;
                                        currentIndex = 1;
                                      });
                                      //Navigator push homepage
                                    },
                                    child: Text("NFT", style: TextStyle(fontSize: 20,
                                      color: Colors.white,
                                    ),),
                                  ),
                                ),


                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                ),

              ],

            ),
            SizedBox(height: 30,),
            screens[currentIndex],
          ]
      ),
    );
  }
}
