// auth_remote_data_source.dart
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_ease/common/common.dart';
import 'package:shop_ease/core/di/locators.dart';
import 'package:shop_ease/core/exceptions/req_exception.dart';
import 'package:shop_ease/core/logger.dart';
import 'package:shop_ease/features/auth/data/dto/login_dto.dart';
import 'package:shop_ease/features/auth/data/dto/register_dto.dart';
import 'package:shop_ease/features/auth/domain/models/user_model.dart';
import 'package:shop_ease/root_app.dart';
import 'package:shop_ease/services/network_service.dart';

final remoteDSProvider = Provider((ref) => AuthRemoteDataSource(
      api: ref.watch(apiProvider),
    ));

class AuthRemoteDataSource {
  final Api _api;
  AuthRemoteDataSource({required Api api}) : _api = api;
  // final network = locator<NetworkService>();
  // final log = locator<Logger>();

  Future<UserModel?> signUp(RegisterDto payload) async {
    try {
      final res = await _api.postReq(
        path: 'your_sign_up_api_endpoint',
        useBaseUrl: false,
        data: payload.toMap(),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        // Parse the response and return the user data
        return UserModel.fromJson(res.data);
      } else {
        // Handle other non-successful status codes
        return null;
      }
    } catch (error) {
      // Handle Dio errors
      print('Error during sign-up: $error');
      return null;
    }
  }

  Future<UserModel?> login(LoginDto payload) async {
    try {
      final res = await _api.postReq(
        path: 'auth/login',
        data: payload.toMap(),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        // Parse the response and return the user data
        // log.logger(res.data['token']);
        await AppRouter.pushAndRemoveUntil(const RootApp());
        return UserModel.fromJson(res.data);
      } else {
        // Handle other non-successful status codes
        return null;
      }
    } on DioException catch (error) {
      // Handle Dio errors
      ReqException.handleError(error);
      // log.logger('Error during sign-in: $error');
      return null;
    }
  }
}
