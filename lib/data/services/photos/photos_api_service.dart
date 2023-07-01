// Source code generation in Dart works by creating a new file which contains a "companion class".
// In order for the source gen to know which file to generate and which files are "linked", you need to use the part keyword.
import 'package:chopper_lessons/data/models/photos/photo_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'photos_api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class PhotosApiService {
  @GET('/photos')
  Future<List<PhotoModel>> getPhotos({
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @GET('/photos/{id}')
  // Query parameters are specified the same way as @Path
  // but obviously with a @Query annotation
  Future<PhotoModel> getPhoto(@Path('id') int id);

  static PhotosApiService create() {
    final client = Dio(BaseOptions(contentType: "application/json"));
    // The generated class with the ChopperClient passed in
    return _PhotosApiService(client);
  }
}
