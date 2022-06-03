import 'package:flutter/material.dart';

import '../../Object Classes/colors.dart';
class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: 500,

              decoration: BoxDecoration(
                  color: AppColor.WelcomeBackground,
                  borderRadius: BorderRadius.only(bottomLeft: const Radius.circular(50),bottomRight:  Radius.circular(50))
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: (){}, child: const Text("Discover NFT's", style: TextStyle(
                          fontSize: 20,color: Colors.black,
                        ))),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextButton(onPressed: (){}, child: const Text("Discover Post's", style: TextStyle(
                            fontSize: 20,color: Colors.black,
                          ))),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: const Image(width: 240,
                              image: NetworkImage(
                                  "https://uzmancoin.com/wp-content/uploads/2021/09/apebalon.png")),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: const Image(width: 150,
                              image: NetworkImage(
                                  "https://pbs.twimg.com/profile_images/1310512844954370048/W5NEr-3W_400x400.jpg")),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: (){}, child: const Text("Discover The App", style: TextStyle(
                          fontSize: 20,color: Colors.black,
                        ))),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: const Image(width:320,
                              image: NetworkImage(
                                  "https://cdn.motor1.com/images/mgl/0e4xNm/s1/lamborghini-aventador-successor-rendering.webp")),
                        ),

                      ],
                    ),
                  ],
                ),

              ),


            ),
            const SizedBox(height: 80,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColor.circuitsColor,

                  ),

                  child: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        hoverColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "Search for users",
                        icon: Icon(Icons.search,color: Colors.white,),
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),

                      ),
                    ),
                  ),

                ),

              ],
            ),
          ],
        ),
      );

  }
}
