import 'package:flutter/material.dart';
import 'package:proj_v2/colors.dart';


class NftPage extends StatefulWidget {
  const NftPage({Key? key}) : super(key: key);

  @override
  State<NftPage> createState() => _NftPageState();
}

class _NftPageState extends State<NftPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 60,),
                          child: CircleAvatar(
                            child: ClipOval(
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBCrOuR4hN2mppQ8YPawUUNfFyjsj5Frqs5Q&usqp=CAU',
                                fit: BoxFit.cover,
                              ),
                            ),
                            radius: 70,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(child: Center(child: const Text("@Username",
                          style: TextStyle(fontSize: 20),)),

                            width: 150,
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColor.SecondMainColor,

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
                    height: 800,
                    decoration: BoxDecoration(
                      color: AppColor.SecondMainColor,

                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(60),
                        topLeft: Radius.circular(60),
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
                            child: Center(
                              child: Text('NFT Page', style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [

                          Container(
                            margin: const EdgeInsets.only(top: 40,),
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),

                            child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Image(width: 500,
                                    image: NetworkImage(
                                        "https://d1lss44hh2trtw.cloudfront.net/assets/article/2022/01/26/bayc-racism_feature.jpg"))
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        margin: const EdgeInsets.only(top: 40,),
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Image(width: 500,
                                image: NetworkImage(
                                    "https://www.webtekno.com/images/editor/default/0003/38/a8c6c85578b025e1bc1c2bee7a3eaea678b90d0b.jpeg"))
                        ),
                      ),
                    ),

                  ],
                )),

              ],
            )
          ],
        ),
      ),
    );
  }
}
