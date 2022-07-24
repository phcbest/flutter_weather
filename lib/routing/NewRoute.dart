import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("利好"),
        ),
        body: Center(
          child: const Text("涨停咯"),
        ));
  }
}
