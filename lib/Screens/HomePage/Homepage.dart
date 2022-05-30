import 'package:cs310_mainproject/Screens/HomePage/DiscoverV2.dart';
import 'package:cs310_mainproject/Screens/HomePage/nftV2.dart';
import 'package:cs310_mainproject/Screens/HomePage/postV2.dart';
import 'package:cs310_mainproject/Screens/HomePage/post_page.dart';
import 'package:cs310_mainproject/Screens/Profile/ProfileV2.dart';
import 'package:cs310_mainproject/Screens/Profile/Profile_posts.dart';

import 'package:flutter/material.dart';

import '../../Object Classes/colors.dart';
import 'discover.dart';
import 'nft_page.dart';
bool _isDarkMode = false;









class HomePage extends StatefulWidget {
  const HomePage( {Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  final screens = const [
    PostPageV2(),
    NFTPageV2(),
    DiscoverV2(),
    ProfileV2(),

  ];

  void darked(){
    setState(() {
      if(_isDarkMode == false){
        _isDarkMode = true;
      }
      else{
        _isDarkMode=false;
      }

    });
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.white: Colors.black,

      floatingActionButton: FloatingActionButton(onPressed: darked,child: Icon(_isDarkMode ? Icons.dark_mode: Icons.wb_sunny,
        color:_isDarkMode ? Colors.black: Colors.white ,),
        backgroundColor: _isDarkMode ? Colors.white: Colors.black,),


      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: _isDarkMode ? Colors.white: Colors.black ,

        iconSize: 25,
        fixedColor: _isDarkMode ? Colors.black: Colors.white ,
        showSelectedLabels: true,

        unselectedItemColor: Colors.black,




        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),




        items:   [


          BottomNavigationBarItem(
            icon: Icon(Icons.photo,color: AppColor.gradientSecond,),
            label: 'Posts Page',
            backgroundColor: _isDarkMode ? Colors.white: Colors.black,





          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.diamond,color: AppColor.gradientSecond,
            ),
            label: 'NFT Page',
            backgroundColor: _isDarkMode ? Colors.white: Colors.black,


          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,color: AppColor.gradientSecond,
            ),
            label: 'Discover',
            backgroundColor: _isDarkMode ? Colors.white: Colors.black,


          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: AppColor.gradientSecond,),
            label: 'Profile',
            backgroundColor: _isDarkMode ? Colors.white: Colors.black,


          ),

        ],
      ),

      body: screens[currentIndex],


    );
  }
}
