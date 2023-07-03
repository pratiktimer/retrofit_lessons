import 'dart:math';

import 'package:chopper_lessons/presentation/controllers/album_state_notifier.dart';
import 'package:chopper_lessons/presentation/image_widget.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlbumListScreen extends HookConsumerWidget {
  const AlbumListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photosState = ref.watch(albumsStateNotifierProvider);
    return Scaffold(
        body: photosState.maybeWhen(
      data: (photos) {
        return ListView.builder(
          itemCount: photos.length,
          itemBuilder: (context, index) {
            final photo = photos[index];
            return Padding(
              padding:
                  const EdgeInsets.only(left: 0, top: 10, bottom: 10, right: 0),
              child: Container(
                decoration: BoxDecoration(
                  //color: Colors.black,
                  // border: Border.all(
                  //   color: Colors.black,
                  //   width: 1.0,
                  //   style: BorderStyle.solid,
                  // ),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 0,
                      spreadRadius: 2,
                      offset:
                          Offset(1, 1), // Specifies the position of the shadow
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Color(Random().nextInt(0xffffffff)).withOpacity(0.5),
                      Color(Random().nextInt(0xffffffff)).withOpacity(0.5),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  // borderRadius: BorderRadius.circular(0.0),
                ),
                child: ListTile(
                  title: Text(
                    photo.title ?? "",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(2, 2),
                          blurRadius: 4.0,
                        ),
                      ],
                    ),
                  ),
                  subtitle: const Text(''),
                  // Display photo image or any other relevant data
                ),
              ),
            );
          },
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text('Error: $error'),
        );
      },
      orElse: () {
        return const SizedBox.shrink();
      },
    ));
  }
}
