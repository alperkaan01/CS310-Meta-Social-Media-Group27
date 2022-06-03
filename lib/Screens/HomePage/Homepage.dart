import 'package:cs310_mainproject/Screens/HomePage/Discover.dart';
import 'package:cs310_mainproject/Screens/HomePage/nft_page.dart';
import 'package:cs310_mainproject/Screens/HomePage/post_page.dart';
import 'package:cs310_mainproject/Screens/HomePage/share.dart';
import 'package:cs310_mainproject/Screens/Profile/Profile_posts.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:flutter/material.dart';

import '../../Object Classes/colors.dart';

import 'nft_page.dart';
bool _isDarkMode = true;









class HomePage extends StatefulWidget {
  const HomePage( {Key? key, required this.analytics, required this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late final screens;

  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver appAnalyticsObserver() => FirebaseAnalyticsObserver(analytics: analytics);

  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screens = [
      PostPage(analytics: widget.analytics,observer: widget.observer,),
      NFTPage(analytics: widget.analytics,observer: widget.observer),
      SharePage(),
      const Discover(),
      Profile(analytics: widget.analytics,observer: widget.observer),
    ];
  }

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
            icon: Icon(Icons.photo,color:_isDarkMode ? Colors.black: Colors.white,),
            label: 'Posts Page',
            backgroundColor: _isDarkMode ? Colors.white: Colors.black,





          ),


          BottomNavigationBarItem(
            icon: Icon(Icons.diamond,color:_isDarkMode ? Colors.black: Colors.white,
            ),
            label: 'NFT Page',
            backgroundColor: _isDarkMode ? Colors.white: Colors.black,


          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline,color:_isDarkMode ? Colors.black: Colors.white ,
            ),
            label: 'Share Page',
            backgroundColor: _isDarkMode ? Colors.white: Colors.black,


          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,color:_isDarkMode ? Colors.black: Colors.white,
            ),
            label: 'Discover',
            backgroundColor: _isDarkMode ? Colors.white: Colors.black,


          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person, color:_isDarkMode ? Colors.black: Colors.white,),
            label: 'Profile',
            backgroundColor: _isDarkMode ? Colors.white: Colors.black,


          ),

        ],
      ),

      body: screens[currentIndex],


    );
  }
}
