import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:chopper_lessons/data/photos_api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SinglePhotoPage extends StatelessWidget {
  final int photoId;

  const SinglePhotoPage({super.key, required this.photoId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chopper Blog'),
      ),
      body: FutureBuilder<Response>(
        future: Provider.of<PhotosApiService>(context).getPhoto(photoId),
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
        ],
      ),
    );
  }
}
