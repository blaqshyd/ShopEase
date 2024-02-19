// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shop_ease/features/auth/models/auth_model.dart';

// final userProfileProvider = Provider<AuthModel>((ref) {
//   // Access your AuthController and get user information

  
//   AuthController authController = ref.watch(authController);
//   if (authController) {
//     // If the user is authenticated, fetch the user profile data
//     // You need to implement a method in your AuthRepository to get user data
//   return authController.getUserProfile();
//   } else {
//     // If the user is not authenticated, return a default or null user profile
//     return UserProfile(); // You may want to set default values or return null
//   }
// });
