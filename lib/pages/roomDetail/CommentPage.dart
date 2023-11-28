import 'package:booking_hotel_ui/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class Comment {
  final String username;
  final String text;

  Comment({required this.username, required this.text});
}

class _CommentPageState extends State<CommentPage> {
  final TextEditingController _commentController = TextEditingController();
  List<Comment> _comments = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Bình luận',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: Assets.image.photo.provider(),
              ),
              const SizedBox(width: 20),
              Container(
                  alignment: Alignment.centerRight,
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                      border: Border.all(width: 5),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white60),
                  child: TextFormField(
                    controller: _commentController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.amber,
                    decoration: const InputDecoration(
                        hintText: 'Bình luận...',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: InputBorder.none),
                  )),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              const SizedBox(
                width: 40,
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  debugPrint('$_commentController');
                  String commentText = _commentController.text;
                  if (commentText.isNotEmpty) {
                    Comment newComment =
                        Comment(username: 'User', text: commentText);
                    _comments.add(newComment);
                    _commentController.clear();
                    setState(() {});
                  }
                },
                child: const Text('Submit Comment'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: _comments.length,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         title: Text(_comments[index].username),
          //         subtitle: Text(_comments[index].text),
          //       );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
