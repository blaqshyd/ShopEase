/// FutureEither takes 2 data types that is not dynamic 
/// and any other datatype like string with the use of fpdart package

import 'package:fpdart/fpdart.dart';
import 'package:shop_ease/core/core.dart';

typedef FutureEither = Future<Either<ApiResponse, ApiResponse>>;
typedef FutureEitherType<T> = Future<Either<ApiResponse, T>>; //? generic type
typedef FutureEitherVoid = FutureEitherType<void>; //? return void
typedef FutureVoid = Future<void>;
typedef MapString = Map<String, dynamic>;
typedef MapType<T> = Map<String, T>;
typedef ListOfString = List<String>;
typedef ListOfInt = List<int>;
typedef ListOfBool = List<bool>;
