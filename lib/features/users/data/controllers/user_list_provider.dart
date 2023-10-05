import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_state/features/users/data/model/user_model.dart';
import 'package:river_state/features/users/data/repository/user_list_repo.dart';

final usersProvider = FutureProvider.autoDispose<List<User>>((ref) async {
  final users = await ref.watch(userListRepository).getUsers();
  return users;
});
