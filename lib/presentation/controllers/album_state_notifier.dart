import 'package:chopper_lessons/data/models/albums/album_model.dart';
import 'package:chopper_lessons/data/services/albums/album_api_service.dart';

import 'package:chopper_lessons/presentation/controllers/controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final albumsStateNotifierProvider =
    StateNotifierProvider<AlbumStateNotifier, AsyncValue<List<AlbumModel>>>(
        (ref) {
  final photosApiService = ref.watch(albumApiServiceProvider);
  return AlbumStateNotifier(photosApiService);
});

class AlbumStateNotifier extends StateNotifier<AsyncValue<List<AlbumModel>>> {
  final AlbumApiService photosApiService;

  AlbumStateNotifier(this.photosApiService)
      : super(const AsyncValue.loading()) {
    getPhotos();
  }

  Future<void> getPhotos({int? page, int? limit}) async {
    try {
      final List<AlbumModel> photos =
          await photosApiService.getAlbums(page: page, limit: limit);
      state = AsyncValue.data(photos);
    } catch (e) {
      state = AsyncValue.error('An error occurred', StackTrace.current);
    }
  }
}
