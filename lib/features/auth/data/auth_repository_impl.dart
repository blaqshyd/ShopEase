import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_ease/features/auth/data/datasource/local_datasource.dart';
import 'package:shop_ease/features/auth/data/datasource/remote_datasource.dart';
import 'package:shop_ease/features/auth/domain/models/user_model.dart';
import 'package:shop_ease/features/auth/domain/auth_repository.dart';

// final authRepo = Provider((ref) => AuthRepositoryImpl(dioHelper: DioHelper()));
// final DioHelper _dioHelper;
// AuthRepositoryImpl({required DioHelper dioHelper}) : _dioHelper = dioHelper;

final authRepoProvider = Provider((ref) => AuthRepositoryImpl(
      remoteDS: ref.watch(remoteDSProvider),
      localDS: ref.watch(localDSProvider),
    ));

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource _localDS;
  final AuthRemoteDataSource _remoteDS;
  // final log = locator<Logger>();

  AuthRepositoryImpl({
    required AuthLocalDataSource localDS,
    required AuthRemoteDataSource remoteDS,
  })  : _localDS = localDS,
        _remoteDS = remoteDS;

  @override
  Future<UserModel> getUserProfile() {
    // TODO: implement getUserProfile
    throw UnimplementedError();
  }

  @override
  Future<UserModel> login(
      String username, String password, BuildContext context) {
    // TODO: implement login
    throw UnimplementedError();
  }

  // @override
  // Future<UserModel?> login(
  //   String username,
  //   String password,
  //   LoginDto payload,
  //   BuildContext context,
  // ) async {
  //   // Example implementation:
  //   // 1. Check local data source for cached data
  //   // 2. If data is not available locally, fetch from remote data source
  //   // 3. Perform authentication logic
  //   // try {
  //     // Fetch from local data source
  //   final cachedData = await _localDS.saveUser();

  //     if (cachedData != null) {
  //       // Process cached data
  //     } else {
  //       // Fetch from remote data source
  //   final remoteData = await _remoteDS.login(payload);

  //       // Process remote data
  //   //   }

  //     // Perform authentication logic
  //   // } catch (e) {
  //     // Handle errors
  //   }

  //   return UserModel.fromJson(cachedData);
  // }
}
