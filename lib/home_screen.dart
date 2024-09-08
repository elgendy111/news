import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/category/category_details.dart';
import 'package:news/category/category_grid.dart';
import 'package:news/category/category_model.dart';
import 'package:news/drawer/home_drawer.dart';
import 'package:news/settings/settings_tab.dart';
import 'package:news/tabs/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppTheme.white,
          image: DecorationImage(
            image: AssetImage(
              'assets/images/pattern.png',
            ),
            fit: BoxFit.fill,
          )),
      child: Scaffold(
        appBar: AppBar(
          title: Text('News App'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    SearchTab.routeName,
                    arguments: '',
                  );
                },
                icon: const Icon(
                  Icons.search,
                  color: AppTheme.white,
                  size: 28,
                ))
          ],
        ),
        drawer: HomeDrawer(
          onItemSelected: onDrawerItemSelected,
        ),
        body: selectedCategory != null
            ? CategoryDetails(selectedCategory!.id)
            : selectedDrawerItem == DrawerItem.categories
                ? CategoryGrid(
                    selectedCategory: onCategorySelect,
                  )
                : const SettingsTab(),
      ),
    );
  }

  DrawerItem selectedDrawerItem = DrawerItem.categories;
  CategoryModel? selectedCategory;

  void onDrawerItemSelected(DrawerItem drawerItem) {
    selectedDrawerItem = drawerItem;
    selectedCategory = null;
    setState(() {});
    Navigator.of(context).pop();
  }

  void onCategorySelect(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }
}
