import 'package:chopper_lessons/data/services/photos/photos_api_service.dart';
import 'package:chopper_lessons/presentation/controllers/controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/photos/photo_model.dart';

final photoStateNotifierProvider =
    StateNotifierProvider<PhotoStateNotifier, AsyncValue<List<PhotoModel>>>(
        (ref) {
  final photosApiService = ref.watch(photosApiServiceProvider);
  return PhotoStateNotifier(photosApiService);
});

class PhotoStateNotifier extends StateNotifier<AsyncValue<List<PhotoModel>>> {
  final PhotosApiService photosApiService;

  PhotoStateNotifier(this.photosApiService)
      : super(const AsyncValue.loading()) {
    getPhotos();
  }

  Future<void> getPhotos({int? page, int? limit}) async {
    try {
      final List<PhotoModel> photos =
          await photosApiService.getPhotos(page: page, limit: limit);
      state = AsyncValue.data(photos);
    } catch (e) {
      state = AsyncValue.error('An error occurred', StackTrace.current);
    }
  }
}
