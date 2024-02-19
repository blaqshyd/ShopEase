import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_ease/features/auth/domain/models/user_model.dart';

abstract class LocalStorageRepository {
  Future<Box> openBox();
  List<UserModel> getUser();
  Future<void> addUser(Box box, UserModel user);
}

class LocalStorageImp implements LocalStorageRepository {
  @override
  Future<Box> openBox() {
    // TODO: implement openBox
    throw UnimplementedError();
  }

  @override
  List<UserModel> getUser() {
    // TODO: implement getChatMessages
    throw UnimplementedError();
  }

  @override
  Future<void> addUser(Box box, UserModel user) {
    // TODO: implement addMessage
    throw UnimplementedError();
  }
}
