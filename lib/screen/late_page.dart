import 'package:flutter/material.dart';

class LatePage extends StatefulWidget {
  const LatePage({super.key});

  @override
  State<LatePage> createState() => _LatePageState();
}

class _LatePageState extends State<LatePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [Text("asd")],
      ),
    );
  }
}
