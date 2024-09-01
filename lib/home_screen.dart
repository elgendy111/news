import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/category/category_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
        ),
        body: CategoryGrid(),
      ),
    );
  }
}
