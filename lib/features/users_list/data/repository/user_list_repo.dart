import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_state/features/users_list/data/model/user_model.dart';

final userListRepository = Provider((ref) => UserListRepo());

class UserListRepo {
  final Dio _dio = Dio();

  Future<List<User>> getUsers() async {
    final res = await _dio.get('https://jsonplaceholder.typicode.com/users');
    final List<dynamic> userList = res.data;
    final user = userList.map((e) => User.fromJson(e)).toList();

    return user;
  }
}
