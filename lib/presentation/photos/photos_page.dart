import 'dart:convert';
import 'package:chopper_lessons/presentation/photos/single_photo_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../data/models/photos/photo_model.dart';
import '../../data/services/photos/photos_api_service.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Retrofit'),
        ),
        body: _buildBody(context));
  }

  FutureBuilder<List<PhotoModel>> _buildBody(BuildContext context) {
    // FutureBuilder is perfect for easily building UI when awaiting a Future
    // Response is the type currently returned by all the methods of PostApiService
    return FutureBuilder<List<PhotoModel>>(
      // In real apps, use some sort of state management (BLoC is cool)
      // to prevent duplicate requests when the UI rebuilds
      future: Provider.of<PhotosApiService>(context).getPhotos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Snapshot's data is the Response
          // You can see there's no type safety here (only List<dynamic>)
          final List<PhotoModel> posts = snapshot.data!;
          return _buildPosts(context, posts);
        } else {
          // Show a loading indicator while waiting for the posts
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildPosts(BuildContext context, List<PhotoModel> photos) {
    return ListView.builder(
      itemCount: photos.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        var photo = photos[index];
        return Card(
          elevation: 4,
          child: ListTile(
            leading: ImageWidget(imageUrl: photo.thumbnailUrl),
            title: Text(
              photo.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () => _navigateToPhotoPage(context, photo.id),
          ),
        );
      },
    );
  }

  void _navigateToPhotoPage(BuildContext context, int id) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SinglePhotoPage(photoId: id),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  const ImageWidget({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundImage: FadeInImage.memoryNetwork(
        key: key,
        placeholder: kTransparentImage, // Placeholder image
        image: imageUrl, // Actual image URL
        fit: BoxFit.cover,
      ).image,
    );
  }
}
