import 'package:flutter/material.dart';
import '../Object Classes/post.dart';

class PostCard extends StatelessWidget {

  final Post post;
  final VoidCallback delete;

  final VoidCallback likeIncrement;

  PostCard({required this.post, required this.delete, required this.likeIncrement});
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
                        post.UserURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                    radius: 15,
                  ),
                ),
                Text(post.username,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
              ],


            ),
            Image.network(
                post.URL
            ),
            Text(
              post.text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                    post.date,
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
                    post.likes.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    )
                ),

                const SizedBox(width: 8),

                const Icon(
                  Icons.comment,
                  size: 14.0,
                  color: Colors.blue,
                ),

                Text(
                    post.comments.toString(),
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
