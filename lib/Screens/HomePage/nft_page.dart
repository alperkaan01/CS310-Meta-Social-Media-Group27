import 'package:cs310_mainproject/Object%20Classes/auth.dart';
import 'package:cs310_mainproject/Screens/Login/Login.dart';
import 'package:cs310_mainproject/Screens/Welcome/welcome_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Object Classes/colors.dart';
import '../../Object Classes/nft.dart';
import '../../UI/nftcard.dart';
class NFTPage extends StatefulWidget {
  const NFTPage({Key? key, required this.analytics, required this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  State<NFTPage> createState() => _NFTPageState();
}

class _NFTPageState extends State<NFTPage> {
  List<NFT> nfts = [
    NFT( URL: "https://jingculturecommerce.com/wp-content/uploads/2021/11/rtfkt-murakami-clone-x-2-1240x826.jpg", UserURL: 'https://support.signal.org/hc/article_attachments/360083910451/animated-2.gif' ,text: 'Hello MetaWorld 1', date: 'March 31', likes: 10, money: 1000,username: 'User62'),
    NFT( URL: "https://www.presse-citron.net/app/uploads/2022/03/bored-ape-metavers-yuga-labs.jpg",UserURL: 'https://support.signal.org/hc/article_attachments/360083910451/animated-2.gif' ,text: 'Hello MetaWorld 2', date: 'March 30', likes: 0, money: 750,username: 'User62'),
    NFT( URL: "https://cryptopotato.com/wp-content/uploads/2022/01/img3_cryptopunks.jpg", UserURL: 'https://support.signal.org/hc/article_attachments/360083910451/animated-2.gif', text: 'Hello MetaWorld 3', date: 'March 29', likes: 20, money: 600,username: 'User93'),
  ];
  void deleteNFT(NFT nft) {
    setState(() {
      nfts.remove(nft);
    });
  }
  void LikeIncrementNFT(NFT nft) {
    setState(() {
      nft.likes++;
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
  void colorChange(){
    setState(() {
      if(currentColor <5){
        currentColor = currentColor +1;

      }
      else{
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
                  }));  //Use navigatorpushandremoveuntil !!!
                },
                  backgroundColor: colors[currentColor],
                  child: const Icon(Icons.logout,color: Colors.black,),),
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
                            child: Text('NFT Page', style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
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

                ],
              )),

            ],
          )
        ],
      ),
    );

  }
}
