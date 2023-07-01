// Source code generation in Dart works by creating a new file which contains a "companion class".
// In order for the source gen to know which file to generate and which files are "linked", you need to use the part keyword.
import 'package:chopper_lessons/data/models/albums/album_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'album_api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class AlbumApiService {
  @GET('/albums')
  Future<List<AlbumModel>> getAlbums({
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @GET('/albums/{id}')
  // Query parameters are specified the same way as @Path
  // but obviously with a @Query annotation
  Future<AlbumModel> getAlbum(@Path('id') int id);

  static AlbumApiService create() {
    final client = Dio(BaseOptions(contentType: "application/json"));
    // The generated class with the ChopperClient passed in
    return _AlbumApiService(client);
  }
}
