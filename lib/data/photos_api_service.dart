import 'package:chopper/chopper.dart';

// Source code generation in Dart works by creating a new file which contains a "companion class".
// In order for the source gen to know which file to generate and which files are "linked", you need to use the part keyword.
part 'photos_api_service.chopper.dart';

@ChopperApi(baseUrl: '/photos')
abstract class PhotosApiService extends ChopperService {
  @Get(path: '?_page=1&_limit=10')
  Future<Response> getPhotos();

  @Get(path: '/{id}')
  // Query parameters are specified the same way as @Path
  // but obviously with a @Query annotation
  Future<Response> getPhoto(@Path('id') int id);

  static PhotosApiService create() {
    final client = ChopperClient(
      // The first part of the URL is now here
      baseUrl: Uri(scheme: 'https', host: 'jsonplaceholder.typicode.com'),
      services: [
        // The generated implementation
        _$PhotosApiService(),
      ],
      // Converts data to & from JSON and adds the application/json header.
      converter: const JsonConverter(),
    );

    // The generated class with the ChopperClient passed in
    return _$PhotosApiService(client);
  }
}
