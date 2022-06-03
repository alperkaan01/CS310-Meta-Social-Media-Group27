import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class ShareNFT extends StatefulWidget {
  const ShareNFT({Key? key}) : super(key: key);

  @override
  State<ShareNFT> createState() => _ShareNFTState();
}

class _ShareNFTState extends State<ShareNFT> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 275,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,

                borderRadius: BorderRadius.circular(40),
              ),
              child: IconButton(
                onPressed: (){},
                icon: Icon(Icons.diamond,size: 100,),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top:10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                width: 400,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.lightBlueAccent,

                ),
                child: TextField(


                  decoration: InputDecoration(

                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    border: InputBorder.none,
                    hintText: "Set Price",
                    icon: Icon(
                      Icons.monetization_on,
                      color: Colors.black,
                    ),

                    hintStyle: GoogleFonts.bebasNeue(

                        color: Colors.black,
                        fontSize: 20

                    ),

                  ),
                ),



              ),


            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.lightBlueAccent,

                ),
                child: TextField(


                  decoration: InputDecoration(

                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    border: InputBorder.none,
                    hintText: "Post Title",
                    icon: Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),

                    hintStyle: GoogleFonts.bebasNeue(

                        color: Colors.black,
                        fontSize: 20

                    ),

                  ),
                ),



              ),

            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: 10,bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 140,
                height: 50,
                decoration: BoxDecoration(
                  color:Colors.black,

                  borderRadius: BorderRadius.circular(40),
                ),
                child: FlatButton(
                  onPressed: () {

                  },
                  child: Text("SEND", style: TextStyle(fontSize: 20,
                    color: Colors.white,
                  ),),
                ),
              ),
            ],
          ),
        ),



      ],
    );
  }
}
