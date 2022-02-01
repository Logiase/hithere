import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class TodayView extends StatelessWidget {
  const TodayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text('Today').center(),
    );
  }
}
