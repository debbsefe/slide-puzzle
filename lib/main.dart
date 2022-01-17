// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final random = Random();

  List<int> list = List<int>.generate(200, (i) => i);

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.biggest.width;
        final height = constraints.biggest.height;
        return Stack(
          children: list.map((i) {
            final avatarSize = random.nextInt(15) * i;

            return AnimatedPositioned(
              duration: const Duration(seconds: 5),
              curve: Curves.ease,
              left: random.nextInt(15) +
                  (width - 2 * random.nextInt(15)) /
                      100.0 *
                      random.nextInt(100),
              top: random.nextInt(15) +
                  (height - 2 * random.nextInt(15)) /
                      100.0 *
                      random.nextInt(100),
              child: Container(
                height: avatarSize.toDouble(),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 1,
                      spreadRadius: 2,
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
