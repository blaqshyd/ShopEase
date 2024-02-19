import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_ease/features/auth/presentation/controllers/auth_controller.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final a = user.asData?.value.email;

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Text('user $a'),
        ],
      )),
    );
  }
}
