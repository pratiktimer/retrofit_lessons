import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../models/posts/post_model.dart';

part 'post_api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class PostApiService {
  @GET('/posts')
  Future<List<PostModel>> getPosts();

  @GET('/posts/{id}')
  // Query parameters are specified the same way as @Path
  // but obviously with a @Query annotation
  Future<PostModel> getPost(@Path('id') int id);

  @POST('/posts')
  Future<PostModel> createPost(@Body() PostModel post);

  @PUT('/posts/{id}')
  Future<PostModel> updatePost(@Path('id') int id, @Body() PostModel post);

  @PATCH('/posts/{id}')
  Future<PostModel> patchPost(@Path('id') int id, @Body() PostModel post);

  @DELETE('/posts/{id}')
  Future<void> deletePost(@Path('id') int id);

  static PostApiService create() {
    final client = Dio(BaseOptions(contentType: "application/json"));
    // The generated class with the ChopperClient passed in
    return _PostApiService(client);
  }
}
