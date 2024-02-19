// auth_local_data_source.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:shop_ease/features/auth/domain/models/user_model.dart';


final localDSProvider = Provider((ref) => AuthLocalDataSource());

class AuthLocalDataSource {
  final String _boxName = 'authBox';

  Future<void> saveUser(UserModel user) async {
    final box = await Hive.openBox(_boxName);
    await box.put('user', user);
  }

  Future<UserModel?> getUser() async {
    final box = await Hive.openBox(_boxName);
    return box.get('user') as UserModel?;
  }
}


// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:shop_ease/features/auth/models/user_model.dart';

// abstract class LocalStorageRepository {
//   Future<Box> openBox();
//   List<UserModel> getUser();
//   Future<void> addUser(Box box, UserModel user);
// }

// class LocalStorageImp implements LocalStorageRepository {
//   @override
//   Future<Box> openBox() {
//     // TODO: implement openBox
//     throw UnimplementedError();
//   }

//   @override
//   List<UserModel> getUser() {
//     // TODO: implement getChatMessages
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> addUser(Box box, UserModel user) {
//     // TODO: implement addMessage
//     throw UnimplementedError();
//   }
// }
