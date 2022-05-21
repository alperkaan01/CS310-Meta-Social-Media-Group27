import 'package:flutter/material.dart';
import 'package:proj_v2/nft_page.dart';
import 'package:proj_v2/post_page.dart';
import 'package:proj_v2/colors.dart';







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
    Center(child:Text("Profile")),

  ];



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,


        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),




        items:   [


          BottomNavigationBarItem(
            icon: Icon(Icons.photo,color: AppColor.gradientSecond,),
            label: 'Posts Page',
            backgroundColor: Colors.blue,




          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.diamond,color: AppColor.gradientSecond,
            ),
            label: 'NFT Page',
            backgroundColor: Colors.blue,

          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: AppColor.gradientSecond,),
            label: 'Profile',
            backgroundColor: Colors.blue,

          ),

        ],
      ),
      backgroundColor: AppColor.gradientSecond,
      body: screens[currentIndex],
    );
  }
}
