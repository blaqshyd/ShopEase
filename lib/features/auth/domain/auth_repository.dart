// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shop_ease/features/auth/domain/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> login(
    String username,
    String password,
    BuildContext context,
  );

  // Future<UserModel> login(LoginDto payload, BuildContext context);

  Future<UserModel> getUserProfile();
}
