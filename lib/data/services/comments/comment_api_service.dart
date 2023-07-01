// Source code generation in Dart works by creating a new file which contains a "companion class".
// In order for the source gen to know which file to generate and which files are "linked", you need to use the part keyword.
import 'package:chopper_lessons/data/models/comment/comment_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'comment_api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class CommentApiService {
  @GET('/comments')
  Future<List<CommentModel>> getComments({
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @GET('/comments/{id}')
  Future<CommentModel> getComment(@Path('id') int id);

  @GET('/comments')
  Future<List<CommentModel>> getCommentsByPostId(
    @Query('postId') int postId, {
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  static CommentApiService create() {
    final client = Dio(BaseOptions(contentType: "application/json"));
    // The generated class with the ChopperClient passed in
    return _CommentApiService(client);
  }
}
