import 'package:flutter/material.dart';
import 'package:proj_v2/colors.dart';
import 'package:proj_v2/login.dart';
class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {



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
        Row(

        children: [
        FloatingActionButton(onPressed: (){
          Navigator.pop(context, MaterialPageRoute(builder: (context){
            return const Login();
          }));
        },
          backgroundColor: AppColor.WelcomeBackground,
          child: const Icon(Icons.logout,color: Colors.black,)
          ,)
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
                            backgroundColor: AppColor.WelcomeBackground,
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
                            child: const Center(
                              child: Text('Post Page', style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [

                        Container(

                          margin: const EdgeInsets.only(top: 40,),
                          height: 300,
                          color: Colors.white,
                          width: size.width,


                          child:  Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: CircleAvatar(
                                      backgroundColor: AppColor.SecondMainColor,
                                      child: ClipOval(
                                        child: Image.network(
                                          'https://support.signal.org/hc/article_attachments/360083910451/animated-2.gif',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      radius: 15,
                                    ),
                                  ),
                                  const Text("User17",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                ],
                              ),

                              const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Image(width: 450,
                                      image: NetworkImage(
                                          "https://www.oggusto.com/uploads/images/custom/15814-kategori.jpg"))
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [

                        Container(

                          margin: const EdgeInsets.only(top: 40,),
                          height: 320,
                          color: Colors.white,
                          width: size.width,


                          child:  Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: CircleAvatar(
                                      backgroundColor: AppColor.SecondMainColor,
                                      child: ClipOval(
                                        child: Image.network(
                                          'https://support.signal.org/hc/article_attachments/360083910451/animated-2.gif',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      radius: 15,
                                    ),
                                  ),
                                  Text("User62",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                ],
                              ),

                              const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Image(width: 450,
                                      image: NetworkImage(
                                          "https://www.yabanihayvanlar.com/wp-content/uploads/2021/04/fil.jpg"))
                              ),
                            ],
                          ),
                        ),
                      ],
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
