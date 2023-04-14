import 'package:flutter/material.dart';

class Counterwidget extends StatefulWidget {
  const Counterwidget({super.key});

  @override
  State<Counterwidget> createState() => _CounterwidgetState();
}

class _CounterwidgetState extends State<Counterwidget> {
  // i defined a list of numbers here that i will be using
  List<int> numbers = [
    1,
    2,
    3,
    4,
  ];
  void _resetList() {
    // i reset the list here
    setState(() {
      numbers = [1, 2, 3, 4];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int last = numbers.last;
          setState(() {
            numbers[numbers.length - 1] += 4;
          });
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(),
      body: SizedBox(
        child: Column(
          children: [
            Text(numbers.last.toString()),
            // this shows the number added to each last element
            Text('number of elements ${numbers.length}'),
            Expanded(
                child: ListView.builder(
                    itemCount: numbers.length,
                    itemBuilder: ((context, index) {
                      return Text(numbers[index].toString());
                    }))),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 45),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  onPressed: _resetList,
                  child: const Icon(Icons.restore),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
