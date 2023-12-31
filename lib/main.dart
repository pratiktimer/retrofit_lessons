import 'package:chopper_lessons/data/photos_api_service.dart';
import 'package:chopper_lessons/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/post_api_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PostApiService>(
          create: (_) => PostApiService.create(),
          dispose: (context, PostApiService service) =>
              service.client.dispose(),
        ),
        Provider<PhotosApiService>(
          create: (_) => PhotosApiService.create(),
          dispose: (context, PhotosApiService service) =>
              service.client.dispose(),
        ),
      ],
      child: const MaterialApp(
        title: 'Material App',
        home: HomePage(),
      ),
    );
  }
}
