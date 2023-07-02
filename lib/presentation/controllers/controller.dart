import 'package:chopper_lessons/data/services/posts/post_api_service.dart';
import 'package:riverpod/riverpod.dart';

import '../../data/services/albums/album_api_service.dart';
import '../../data/services/comments/comment_api_service.dart';
import '../../data/services/photos/photos_api_service.dart';
import '../../data/services/users/user_api_service.dart';

final albumApiServiceProvider = Provider<AlbumApiService>((ref) {
  return AlbumApiService.create();
});

final commentApiServiceProvider = Provider<CommentApiService>((ref) {
  return CommentApiService.create();
});
final photosApiServiceProvider = Provider<PhotosApiService>((ref) {
  return PhotosApiService.create();
});
final postApiServiceProvider = Provider<PostApiService>((ref) {
  return PostApiService.create();
});
final userApiServiceProvider = Provider<UserApiService>((ref) {
  return UserApiService.create();
});
