import 'package:chopper_lessons/data/models/users/user_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'user_api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class UserApiService {
  @GET('/users')
  Future<List<UserModel>> getUsers();

  @GET('/users/{id}')
  // Query parameters are specified the same way as @Path
  // but obviously with a @Query annotation
  Future<UserModel> getUser(@Path('id') int id);

  static UserApiService create() {
    final client = Dio(BaseOptions(contentType: "application/json"));
    // The generated class with the ChopperClient passed in
    return _UserApiService(client);
  }
}
