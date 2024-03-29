import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_ease/common/app_router.dart';
import 'package:shop_ease/features/auth/presentation/views/sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Sl.setup();
  // setUpLocator();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(390, 844),
        builder: (context, child) {
          return MaterialApp(
            title: 'Shop Ease',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            navigatorKey: AppRouter.navigatorKey,
            home: const SignInScreen(),
          );
        });
  }
}
