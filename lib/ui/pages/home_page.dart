import 'package:clusek_tt/cubit/cubit/core_cubit.dart';
import 'package:clusek_tt/resources/app_colors.dart';
import 'package:clusek_tt/ui/other/shadow_decoration.dart';
import 'package:clusek_tt/ui/widgets/core_bottom_navigation_bar.dart';
import 'package:clusek_tt/ui/widgets/image_preview.dart';
import 'package:clusek_tt/ui/widgets/submenu_list_item.dart';
import 'package:clusek_tt/ui/widgets/subpage_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var subpageItems = _getSubpageItems();
    var cubitCore = BlocProvider.of<CoreCubit>(context);

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                decoration: ShadowDecoration(),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: BlocBuilder<CoreCubit, CoreState>(
                        bloc: cubitCore,
                        builder: (context, state) {
                          return ListView.builder(
                            itemCount: subpageItems.length,
                            itemBuilder: (context, index) => SubmenuListItem(
                              textValue: subpageItems[index].title,
                              fillBackground: index == state.selectedSubpage,
                              onTap: () => cubitCore.changePage(index),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: 1.0,
                      color: AppColors.separatorColor,
                    ),
                    BlocBuilder<CoreCubit, CoreState>(
                      bloc: cubitCore,
                      builder: (context, state) {
                        return Expanded(
                          flex: 3,
                          child: subpageItems[state.selectedSubpage],
                        );
                      },
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

  List<SubpageItem> _getSubpageItems() {
    return [
      SubpageItem(
        title: 'I/O',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('bbb'),
          ],
        ),
      ),
      SubpageItem(
        title: 'Compression',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('ccc'),
          ],
        ),
      ),
    ];
  }
}
