import 'dart:convert';

import 'package:chopper_lessons/data/models/photos/photo_model.dart';
import 'package:chopper_lessons/data/services/photos/photos_api_service.dart';
import 'package:chopper_lessons/presentation/photos/photos_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SinglePhotoPage extends StatelessWidget {
  final int photoId;

  const SinglePhotoPage({super.key, required this.photoId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrofit'),
      ),
      body: FutureBuilder<PhotoModel>(
        future: Provider.of<PhotosApiService>(context).getPhoto(photoId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final post = snapshot.data!;
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

  Padding _buildPost(PhotoModel post) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          ImageWidget(imageUrl: post.url),
          Text(
            post.title,
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
