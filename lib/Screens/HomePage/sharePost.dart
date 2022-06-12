
import 'dart:io';


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class SharePost extends StatefulWidget {
  const SharePost({Key? key}) : super(key: key);

  @override
  State<SharePost> createState() => _SharePostState();
}

class _SharePostState extends State<SharePost> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future pickImage() async{
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
    
}
Future uploadImageToFirebase(BuildContext context) async{
    String fileName = basename(_image!.path);
    Reference firebaseStorageRef = FirebaseStorage.instance.ref().child('posts/$fileName');
    try{
      
    await firebaseStorageRef.putFile(File(_image!.path));
    print('Upload Complete');
    setState(() {
      _image = null;
    });

    } on FirebaseException catch(e){
      print('ERROR: ${e.code} - ${e.message}');
    }catch(e){
      print(e.toString());
    }
}




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 300,

              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,

                borderRadius: BorderRadius.circular(40),
              ),
              child: ClipRRect(

                borderRadius: BorderRadius.circular(50),

                child: _image != null
                  ? Image.file(File(_image!.path),width: 375,height: 250,) : TextButton(
                    onPressed: pickImage,
                    child: Icon(
                  Icons.add_photo_alternate_outlined,
                  size: 100,
                      color: Colors.black,
                ))
              )
            )
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(top:15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                width: 400,
                height: 80,
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



              ),],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10,bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(_image !=null) Container(
                width: 140,
                height: 50,
                decoration: BoxDecoration(
                  color:Colors.black,

                  borderRadius: BorderRadius.circular(40),
                ),
                child: FlatButton(
                  onPressed: () {
                    uploadImageToFirebase(context);
                  },
                  child: Text("SEND", style: TextStyle(fontSize: 20,
                    color: Colors.white,
                  ),),
                ),
              ),
            ],
          ),
        )


      ],
    );
  }
}
