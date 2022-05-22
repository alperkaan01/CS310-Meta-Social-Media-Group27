Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color.AppColor.SecondMainColor,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: FlatButton(
                      onPressed: (){
                        //Navigator push homepage
                      },
                      child: Text("Posts", style: TextStyle(
                        color: Colors.black,
                      ),),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 70,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color.AppColor.SecondMainColor,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: FlatButton(
                      onPressed: (){
                        //Navigator push homepage
                      },
                      child: Text("NFT", style: TextStyle(
                        color: Colors.black,
                      ),),
                    ),
                  ),
                ],
              ),
