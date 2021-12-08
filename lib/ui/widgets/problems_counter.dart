import 'package:flutter/material.dart';

class ProblemsCounter extends StatelessWidget {
  final int problemsCount;

  const ProblemsCounter({
    Key? key,
    required this.problemsCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: Text(
              problemsCount.toString(),
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Icon(
            Icons.warning,
            size: 28.0,
          ),
        ],
      ),
    );
  }
}
