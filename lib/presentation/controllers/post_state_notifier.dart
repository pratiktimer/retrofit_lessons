import 'package:chopper_lessons/data/models/albums/album_model.dart';
import 'package:chopper_lessons/data/models/posts/post_model.dart';
import 'package:chopper_lessons/data/services/albums/album_api_service.dart';
import 'package:chopper_lessons/data/services/posts/post_api_service.dart';

import 'package:chopper_lessons/presentation/controllers/controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final postStateNotifierProvider =
    StateNotifierProvider<PostStateNotifier, AsyncValue<List<PostModel>>>(
        (ref) {
  final photosApiService = ref.watch(postApiServiceProvider);
  return PostStateNotifier(photosApiService);
});

class PostStateNotifier extends StateNotifier<AsyncValue<List<PostModel>>> {
  final PostApiService photosApiService;

  PostStateNotifier(this.photosApiService) : super(const AsyncValue.loading()) {
    getPhotos();
  }

  Future<void> getPhotos({int? page, int? limit}) async {
    try {
      final List<PostModel> photos = await photosApiService.getPosts();
      state = AsyncValue.data(photos);
    } catch (e) {
      state = AsyncValue.error('An error occurred', StackTrace.current);
    }
  }
}
