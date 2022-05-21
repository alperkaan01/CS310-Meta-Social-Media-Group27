import 'package:flutter/material.dart';
import 'package:proj_v2/colors.dart';
import 'package:proj_v2/Homepage.dart';
class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bool ? isPost = true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [

          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: AppColor.gradientSecond,),
            label: '',
            backgroundColor: Colors.white,


          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline, color: AppColor.gradientSecond,
            ),
            label: 'Share',
            backgroundColor: Colors.blue,

          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: AppColor.gradientSecond,),
            label: 'Profile',
            backgroundColor: Colors.blue,

          ),

        ],
      ),
      backgroundColor: AppColor.gradientSecond,
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
                            radius: 60,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Text("Username", style: TextStyle(fontSize: 20),),
                        Row(
                          children: [
                            FlatButton(onPressed: () {
                              Navigator.pop(context,
                                  MaterialPageRoute(builder: (context) {
                                    return HomePage();
                                  }));
                            }, child: Row(
                              children: [


                                Text("NFT"),
                              ],

                            )),
                            FlatButton(onPressed: () {

                            }, child: Row(
                              children: [


                                Text("POST"),
                              ],

                            ))
                          ],
                        ),
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
                      gradient: LinearGradient(
                        colors: [
                          //AppColor.gradientFirst.withOpacity(0.5),
                          //AppColor.gradientSecond.withOpacity(0.8),
                          //AppColor.SecondMainColor.withOpacity(0.7),
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.8),

                        ],
                      ),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(100),
                        topLeft: Radius.circular(100),
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
                          Text('Post Page', style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),),
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
                              gradient: LinearGradient(
                                colors: [
                                  AppColor.SecondMainColor.withOpacity(0.5),

                                  AppColor.gradientSecond.withOpacity(0.8)
                                  // Colors.white.withOpacity(0.7),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),

                            child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Image(width: 500,
                                    image: NetworkImage(
                                        "https://www.oggusto.com/uploads/images/custom/15814-kategori.jpg"))
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        margin: const EdgeInsets.only(top: 50,),
                        height: 250,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColor.SecondMainColor.withOpacity(0.5),

                              AppColor.gradientSecond.withOpacity(0.8)
                              //Colors.white.withOpacity(0.7),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Image(width: 500,
                                image: NetworkImage(
                                    "https://www.yabanihayvanlar.com/wp-content/uploads/2021/04/fil.jpg"))
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
