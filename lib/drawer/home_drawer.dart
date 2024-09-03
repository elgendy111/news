import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.onItemSelected});
  final void Function(DrawerItem) onItemSelected;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final titleLargeStyle =
        Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24);
    return SizedBox(
      width: screenSize.width * 0.7,
      child: Column(
        children: [
          Container(
            height: screenSize.height * 0.2,
            width: double.infinity,
            color: AppTheme.primary,
            alignment: Alignment.center,
            child: Text(
              'News App!',
              style: titleLargeStyle,
            ),
          ),
          Expanded(
            child: Container(
              color: AppTheme.white,
              padding: EdgeInsetsDirectional.only(top: 20, start: 15),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => onItemSelected(DrawerItem.categories),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.list_outlined,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Categories',
                          style:
                              titleLargeStyle?.copyWith(color: AppTheme.black),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () => onItemSelected(DrawerItem.settings),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.settings_rounded,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Settings',
                          style:
                              titleLargeStyle?.copyWith(color: AppTheme.black),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum DrawerItem {
  categories,
  settings;
}
