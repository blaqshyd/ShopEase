import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_ease/common/common.dart';
import 'package:shop_ease/core/core.dart';

///* Different types of Provider
///? Provider - only allows for ref.read() and ref.watch()
///? StateProvider - Allows for modifying the provider using ref.read()
///? StateNotifier and StateNotifierProvider
final nameProvider = Provider((ref) => 'Daniel Ayodele');
// final nameSProvider = StateProvider<String>((ref) => 'Daniel A');
final nameSProvider = StateProvider<String?>((ref) => null);

///* ref.watch() - Continously watch the provider
///* ref.read() - One-time access to the provider and can be used to modify provider
/// Using the Consumer widget to wrap the widget makes sure the whole widget doesn't rebuild
/// Unlike when using ConsumerWidget or ConsumerStatefulWidget that rebuilds the whole widget
/// So depending on the use-case you could wrap your widget with provider or use wrap the whole widget

class TestRiver extends ConsumerWidget {
  TestRiver({super.key});

  /// Creating a function here to change the textfield value onSubmit
  void onSubmit(WidgetRef ref, String value) {
    ref.read(nameSProvider.notifier).update((state) => value);
  }

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    // final nameRead = ref.read(nameSProvider);
    final nameRead = ref.watch(nameSProvider) ?? 'John Doe';

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                24.sbH,
                Text('Name: $nameRead'),
                12.sbH,
                Text(name.initials),
                56.sbH,
                TextField(
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'John Doe',
                    filled: true,
                    fillColor: AppColor.black4,
                  ),
                  // onChanged: (value) => onSubmit(ref, value),
                  onSubmitted: (value) => onSubmit(ref, value),
                ),
                56.sbH,
                ElevatedButton(
                    onPressed: () {
                      _focusNode.unfocus();
                    },
                    child: const Text('Submit'))
                // Text(nameRead),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
