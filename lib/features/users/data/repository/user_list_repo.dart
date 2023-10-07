import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_ease/features/users/data/model/user_model.dart';

final userListRepository = Provider((ref) => UserListRepo());

class UserListRepo {
  final Dio _dio = Dio();

  Future<List<User>> getUsers() async {
    final res = await _dio.get('https://jsonplaceholder.typicode.com/users');
    final List<dynamic> userList = res.data;
    final user = userList.map((e) => User.fromJson(e)).toList();

    return user;
  }

  Future<List<User>> getPaginatedUsers() async {
    final res = await _dio.get('https://randomuser.me/api/?page=1&results=5');

    final List<dynamic> response = res.data['results'];
    final user2 = response.map((e) => User.fromJson(e)).toList();

    return user2;
  }
}
