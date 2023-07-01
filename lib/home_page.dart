import 'dart:convert';
import 'package:chopper_lessons/data/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';
import 'package:provider/provider.dart';
import 'data/post_api_service.dart';
import 'photos_page.dart';
import 'single_post_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chopper Blog'),
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          // // The JSONPlaceholder API always responds with whatever was passed in the POST request
          // final response = await Provider.of<PostApiService>(context)
          //     .postPost({'key': 'value'});
          // // We cannot really add any new posts using the placeholder API,
          // // so just print the response to the console
          // if (kDebugMode) {
          //   print(response.body);
          // }
          _navigateToPhotosPage(context);
        },
      ),
    );
  }

  FutureBuilder<Response> _buildBody(BuildContext context) {
    // FutureBuilder is perfect for easily building UI when awaiting a Future
    // Response is the type currently returned by all the methods of PostApiService
    return FutureBuilder<Response<List<PostModel>>>(
      // In real apps, use some sort of state management (BLoC is cool)
      // to prevent duplicate requests when the UI rebuilds
      future: Provider.of<PostApiService>(context).getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Snapshot's data is the Response
          // You can see there's no type safety here (only List<dynamic>)
          List<PostModel>? posts = snapshot.data!.body;
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

  ListView _buildPosts(BuildContext context, List<PostModel>? posts) {
    return ListView.builder(
      itemCount: posts?.length ?? 0,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        var post = posts![index];
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              post.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(post.body),
            onTap: () => _navigateToPost(context, post.id),
          ),
        );
      },
    );
  }

  void _navigateToPost(BuildContext context, int id) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SinglePostPage(postId: id),
      ),
    );
  }

  void _navigateToPhotosPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PhotosPage(),
      ),
    );
  }
}
