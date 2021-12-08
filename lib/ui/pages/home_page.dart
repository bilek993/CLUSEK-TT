import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('xyz'),
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'CLUSEK-TT (Texture Tool)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    side: const BorderSide(width: 2.0, color: Colors.white),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 8.0),
                    child: Text(
                      'Convert',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        color: Theme.of(context).primaryColorDark,
      ),
    );
  }
}
