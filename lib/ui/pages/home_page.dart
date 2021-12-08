import 'package:clusek_tt/ui/widgets/core_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Center(
        child: Text('xyz'),
      ),
      bottomNavigationBar: CoreBottomNavigationBar(
        onConvertButtonPressed: () {},
      ),
    );
  }
}
