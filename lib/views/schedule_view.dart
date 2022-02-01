import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text('Schedule').center(),
    );
  }
}