import 'package:cs310_mainproject/Screens/HomePage/post_page.dart';
import 'package:cs310_mainproject/Screens/Profile/profile.dart';
import 'package:flutter/material.dart';

import '../../Object Classes/colors.dart';
import 'discover.dart';
import 'nft_page.dart';







class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens = [
    PostPage(),
    NftPage(),
    Discover_page(),
    Profile_posts(),

  ];



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(


      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        fixedColor: Colors.black,
        showSelectedLabels: true,

        unselectedItemColor: Colors.black,




        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),




        items:   [


          BottomNavigationBarItem(
            icon: Icon(Icons.photo,color: AppColor.gradientSecond,),
            label: 'Posts Page',





          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.diamond,color: AppColor.gradientSecond,
            ),
            label: 'NFT Page',


          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,color: AppColor.gradientSecond,
            ),
            label: 'Discover',


          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: AppColor.gradientSecond,),
            label: 'Profile',


          ),

        ],
      ),
      backgroundColor: AppColor.gradientSecond,
      body: screens[currentIndex],
    );
  }
}
