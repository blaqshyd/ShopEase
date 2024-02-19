import 'package:dio/dio.dart';

class ReqException implements Exception {
  static String handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.cancel:
        return 'Request cancelled';
      case DioExceptionType.connectionTimeout:
        return 'Connection timed out!';
      case DioExceptionType.receiveTimeout || DioExceptionType.sendTimeout:
        return 'Request timed out';
      case DioExceptionType.connectionTimeout ||
            DioExceptionType.connectionError:
        return 'You have no internet connection!';
      case DioExceptionType.badCertificate:
        return 'Bad Certificate';
      case DioExceptionType.badResponse:
        if (e.response?.data is String) {
          return e.response?.data ?? 'Please try again later';
        } else if (e.response?.statusMessage is String) {
          return e.response?.statusMessage ?? 'Something went wrong. ';
        } else {
          return e.response?.data?['message'] ?? 'Something bad happened.';
        }
      default:
        return 'An error occured!';
    }
  }
}
