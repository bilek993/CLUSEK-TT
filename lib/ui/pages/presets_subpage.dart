import 'package:flutter/material.dart';

class PresetsSubpage extends StatefulWidget {
  const PresetsSubpage({Key? key}) : super(key: key);

  @override
  State<PresetsSubpage> createState() => _PresetsSubpageState();
}

class _PresetsSubpageState extends State<PresetsSubpage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [],
      ),
    );
  }
}
