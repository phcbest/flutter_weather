import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     title: 'Flutter Demo',
//     theme: ThemeData(
//       primarySwatch: Colors.blue,
//     ),
//     home: const MyHomePage(title: 'Flutter Demo Home Page'),
//   );
// }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: double.infinity),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, _) {
                var state = ref.watch(testProvider.state).state;
                return Text(state);
              },
            ),
            Text("美好的未来生活"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(testProvider.state).state =
              "世界线:0.${100000 + Random().nextInt(899999)}";
        },
        child: const Icon(Icons.rocket),
      ),
    );
  }

//
// @override
// State<MyHomePage> createState() => _MyHomePageState();
}

final testProvider = StateProvider<String>((ref) => "世界线:0.337187");

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     //修改状态
//     // setState(() {
//     //   _counter++;
//     // });
//
//     //直接进行route跳转
//     // Navigator.push(context, MaterialPageRoute(builder: (context) {
//     //   return NewRoute();
//     // }));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer(builder: (context, ref, _) {
//       final text = ref
//           .watch(helloWorldProvider.state)
//           .state;
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Center(
//           child: Consumer(
//             builder: (context, ref, _) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   const Text(
//                     'You have pushed the button this many times:',
//                   ),
//                   Text(
//                     text,
//                     style: Theme
//                         .of(context)
//                         .textTheme
//                         .headline4,
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           //直接read 后修改
//           onPressed: () =>
//           {ref
//               .read(helloWorldProvider.state)
//               .state == "100"},
//           tooltip: 'Increment',
//           child: const Icon(Icons.add),
//         ),
//       );
//     });
//   }
// }
