import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_ease/common/snackbar_util.dart';
import 'package:shop_ease/core/exceptions/req_exception.dart';
import 'package:shop_ease/features/auth/domain/models/user_model.dart';
import 'package:shop_ease/features/auth/data/auth_repository_impl.dart';

import '../../domain/auth_repository.dart';

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepo;

  AuthController({required AuthRepository authRepo})
      : _authRepo = authRepo,
        super(false);

  login({
    required String username,
    required String password,
    // required LoginDto payload,
    required BuildContext context,
  }) async {
    state = true;
    try {
      await _authRepo.login(username, password, context);
      // await _authRepo.login(payload, context);
      state = false;
    } on DioException catch (e) {
      state = false;

      // ignore: use_build_context_synchronously
      showSnackBar(
        text: ReqException.handleError(e),
        context: context,
      );
      // }
    }
  }
}

final authProvider = StateNotifierProvider<AuthController, bool>(
  (ref) => AuthController(authRepo: ref.watch(authRepoProvider)),
);

final userProvider = FutureProvider<UserModel>((ref) async {
  final user = await ref.watch(authRepoProvider).getUserProfile();
  return user;
});
