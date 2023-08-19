import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prectice_states/getx/River_pod/river_model.dart';

// final numberProvider = Provider<int>(
//   (ref) {
//     return 0;
//   },
// );

// final numberStateProvider = StateProvider<int>((ref) {
//   return 0;
// });
final numProvider = StateNotifierProvider<RNotifier, List<int>>((ref) {
  return RNotifier();
});

final counterNotifier = ChangeNotifierProvider<MyClass>((ref) {
  return MyClass();
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final number = ref.watch(numberProvider);
    // final nsp = ref.watch(numberStateProvider);
    // final num = ref.watch(numProvider);
    final mc = ref.watch(counterNotifier);
    print('re');
    return Scaffold(
      body: Center(
        child: Text(mc.counter.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterNotifier).increment();
          // ref.read(numProvider.notifier).add(1);
          // final number = ref.read(numberStateProvider.state);
          // number.state++;
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
