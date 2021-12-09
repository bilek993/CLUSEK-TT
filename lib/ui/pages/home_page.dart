import 'package:clusek_tt/resources/app_colors.dart';
import 'package:clusek_tt/ui/other/shadow_decoration.dart';
import 'package:clusek_tt/ui/widgets/core_bottom_navigation_bar.dart';
import 'package:clusek_tt/ui/widgets/image_preview.dart';
import 'package:clusek_tt/ui/widgets/submenu_list_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                decoration: ShadowDecoration(),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, index) => SubmenuListItem(
                          textValue: 'XYZ',
                          fillBackground: index == 0,
                        ),
                      ),
                    ),
                    Container(
                      width: 1.0,
                      color: AppColors.separatorColor,
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: const [
                          Text('bbb'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 16.0, 16.0, 16.0),
                child: ImagePreview(pathToFile: null),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CoreBottomNavigationBar(
        onConvertButtonPressed: () {},
      ),
    );
  }
}
