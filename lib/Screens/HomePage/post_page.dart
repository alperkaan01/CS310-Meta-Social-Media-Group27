import 'package:flutter/material.dart';
import 'package:proj_v2/colors.dart';
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
                            color: AppColor.WelcomeBackground,

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
                      color: AppColor.WelcomeBackground,
                      
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
                              child: Text('Post Page', style: TextStyle(
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
                                        "https://www.oggusto.com/uploads/images/custom/15814-kategori.jpg"))
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
