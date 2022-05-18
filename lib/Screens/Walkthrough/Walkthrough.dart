import 'package:cs310_mainproject/colors.dart' as color;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Walkthrough extends StatelessWidget {
  const Walkthrough({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Lets Start", style: TextStyle(fontSize: 30, color: color.AppColor.homePageTitle),),
        ),
      ),
    );
  }
}
