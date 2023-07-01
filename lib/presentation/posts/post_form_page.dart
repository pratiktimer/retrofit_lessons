// import 'package:chopper_lessons/data/models/post_model.dart';
// import 'package:chopper_lessons/data/services/post_api_service.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class PostFormPage extends StatefulWidget {
//   final PostModel? post;

//   PostFormPage({this.post});

//   @override
//   _PostFormPageState createState() => _PostFormPageState();
// }

// class _PostFormPageState extends State<PostFormPage> {
//   TextEditingController _titleController = TextEditingController();
//   TextEditingController _bodyController = TextEditingController();

//   late PostApiService api;

//   @override
//   void initState() {
//     super.initState();
//     if (widget.post != null) {
//       _titleController.text = widget.post!.title ?? '';
//       _bodyController.text = widget.post!.body ?? '';
//     }
//   }

//   @override
//   void dispose() {
//     _titleController.dispose();
//     _bodyController.dispose();
//     super.dispose();
//   }

//   Future<void> _savePost() async {
//     final post = PostModel(
//       1,
//       widget.post?.id ?? 0,
//       _titleController.text,
//       _bodyController.text,
//     );
//     if (widget.post != null) {
//       // Edit existing post
//       await api.updatePost(widget.post!.id!, post);
//     } else {
//       // Add new post
//       await api.createPost(post);
//     }
//     Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     api = Provider.of<PostApiService>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.post != null ? 'Edit Post' : 'Add Post'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _titleController,
//               decoration: InputDecoration(
//                 labelText: 'Title',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: _bodyController,
//               decoration: InputDecoration(
//                 labelText: 'Body',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _savePost,
//               child: Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
