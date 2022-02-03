import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class Times extends StatelessWidget {
  final List<String> rowNames;
  final double height;

  const Times({
    Key? key,
    required this.rowNames,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemHeight = height / rowNames.length;

    final columnChildren = List.generate(rowNames.length, (index) {
      return SizedBox(
        height: itemHeight,
        child: Text(
          '${index + 1}\n${rowNames[index]}',
          textAlign: TextAlign.center,
        ).center(),
      );
    });

    return SizedBox(
      height: height,
      child: Column(
        children: columnChildren,
      ),
    );
  }
}
