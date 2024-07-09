import 'package:flutter/material.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({super.key});

  static const String path = "/diary";
  static const String name = "DiaryPage";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("diary"),
    );
  }
}
