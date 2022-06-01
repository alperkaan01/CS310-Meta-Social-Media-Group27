import 'package:flutter/material.dart';

import '../Object Classes/nft.dart';
import 'package:flutter/material.dart';


class NFTCard extends StatelessWidget {

  final NFT nft;
  final VoidCallback delete;

  final VoidCallback likeIncrement;

  NFTCard({required this.nft, required this.delete, required this.likeIncrement});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white38,
                    child: ClipOval(
                      child: Image.network(
                        nft.UserURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                    radius: 15,
                  ),
                ),
                Text(nft.username,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
              ],


            ),
            Image.network(
                nft.URL
            ),
            Text(
              nft.text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                    nft.date,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    )
                ),

                const Spacer(),

                IconButton(onPressed: likeIncrement, icon: const Icon(
                  Icons.thumb_up,
                  size: 14.0,
                  color: Colors.green,
                ),
                  splashRadius: 15,
                ),
                Text(
                    nft.likes.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    )
                ),

                const SizedBox(width: 8),

                const Icon(
                  Icons.attach_money,
                  size: 14.0,
                  color: Colors.green,
                ),

                Text(
                    nft.money.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    )
                ),

                const SizedBox(width: 8),

                IconButton(
                  iconSize: 14,
                  onPressed: delete,
                  icon: const Icon(Icons.delete, size: 14, color: Colors.red,),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
