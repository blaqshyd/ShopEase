import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_state/features/users/data/controllers/user_list_provider.dart';
import 'package:river_state/features/users/data/repository/user_list_repo.dart';

class UserListScreen extends ConsumerStatefulWidget {
  const UserListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserListScreenState();
}

class _UserListScreenState extends ConsumerState<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    final userList = ref.watch(usersProvider);
    return userList.when(
      data: (data) {
        return Scaffold(
          // appBar: AppBar(title: const Text('List of Users')),
          body: RefreshIndicator.adaptive(
            onRefresh: () async {
              await ref.read(userListRepository).getUsers();
              ref.invalidate(usersProvider);
              print('reloading');
            },
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                final user = data[index];
                return ListTile(
                  leading: const CircleAvatar(),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
            ),
          ),
        );
      },
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}