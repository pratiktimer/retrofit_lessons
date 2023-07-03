import 'package:chopper_lessons/data/models/users/user_model.dart';
import 'package:chopper_lessons/data/services/users/user_api_service.dart';
import 'package:chopper_lessons/presentation/controllers/controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userStateNotifierProvider =
    StateNotifierProvider<UserStateNotifier, AsyncValue<List<UserModel>>>(
        (ref) {
  final usersApiService = ref.watch(userApiServiceProvider);
  return UserStateNotifier(usersApiService);
});

class UserStateNotifier extends StateNotifier<AsyncValue<List<UserModel>>> {
  final UserApiService usersApiService;

  UserStateNotifier(this.usersApiService) : super(const AsyncValue.loading()) {
    getUsers();
  }

  Future<void> getUsers({int? page, int? limit}) async {
    try {
      final List<UserModel> users = await usersApiService.getUsers();
      state = AsyncValue.data(users);
    } catch (e) {
      state = AsyncValue.error('An error occurred', StackTrace.current);
    }
  }
}
