import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_ease/common/common.dart';
import 'package:shop_ease/common/custom_textf.dart';
import 'package:shop_ease/core/core.dart';
import 'package:shop_ease/core/validators.dart';
import 'package:shop_ease/features/auth/presentation/controllers/auth_controller.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends ConsumerState<SignInScreen> {
  final userNameCtrl = TextEditingController(text: "kminchelle");
  final pwdCtrl = TextEditingController(text: "0lelplR");
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    userNameCtrl.dispose();
    pwdCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authProvider);
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const CircularProgressIndicator.adaptive()
            : Padding(
                padding: AppSizing.padding,
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome Back, User',
                        style: AppTextStyle.h3Medium,
                      ),
                      24.sbH,
                      CustomTextf(
                        hintText: 'Enter username',
                        controller: userNameCtrl,
                        validator: (_) =>
                            AppValidator.username(userNameCtrl.text),
                      ),
                      12.sbH,
                      CustomTextf(
                        hintText: 'Password',
                        controller: pwdCtrl,
                        validator: (_) => AppValidator.password(pwdCtrl.text),
                      ),
                      24.sbH,
                      ButtonUtil.filled(
                        text: 'Login',
                        bgColor: AppColor.buttonColor,
                        cta: () => ref.read(authProvider.notifier).login(
                              context: context,
                              username: userNameCtrl.text,
                              password: pwdCtrl.text,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
