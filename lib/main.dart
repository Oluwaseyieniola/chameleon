import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Counter extends StateNotifier<int> {
  Counter() : super(0);
  void increment() => state++;
}

void main() {
// initialize providerScope
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(
    BuildContext context,
  ) {
    return const MaterialApp(
      home: CounterPage(),
    );
  }
}

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(counterStateProvider);
    return Scaffold(
      body: Center(
        child: Text('value:$value'),
      ),
      floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              FloatingActionButton(
                onPressed: () =>
                    ref.read(counterStateProvider.notifier).state++,
                child: const Icon(Icons.add),
              ),
            ],
          )),
    );
  }
}
