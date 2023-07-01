import 'package:chopper/chopper.dart';

import 'models/post_model.dart';

// Source code generation in Dart works by creating a new file which contains a "companion class".
// In order for the source gen to know which file to generate and which files are "linked", you need to use the part keyword.
part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PostApiService extends ChopperService {
  @Get()
  Future<Response<List<PostModel>>> getPosts();

  @Get(path: '/{id}')
  // Query parameters are specified the same way as @Path
  // but obviously with a @Query annotation
  Future<Response> getPost(@Path('id') int id);

  // Put & Patch requests are specified the same way - they must contain the @Body
  @Post()
  Future<Response> postPost(
    @Body() Map<String, dynamic> body,
  );

  static PostApiService create() {
    final client = ChopperClient(
      // The first part of the URL is now here
      baseUrl: Uri(scheme: 'https', host: 'jsonplaceholder.typicode.com'),
      services: [
        // The generated implementation
        _$PostApiService(),
      ],
      // Converts data to & from JSON and adds the application/json header.
      converter: const JsonConverter(),
    );

    // The generated class with the ChopperClient passed in
    return _$PostApiService(client);
  }
}
