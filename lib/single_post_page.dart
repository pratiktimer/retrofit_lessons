import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/post_api_service.dart';

class SinglePostPage extends StatelessWidget {
  final int postId;

  const SinglePostPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chopper Blog'),
      ),
      body: FutureBuilder<Response>(
        future: Provider.of<PostApiService>(context).getPost(postId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final Map post = json.decode(snapshot.data?.bodyString ?? "");
            return _buildPost(post);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Padding _buildPost(Map post) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            post['title'],
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(post['body']),
        ],
      ),
    );
  }
}
