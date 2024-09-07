import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/category/category_item.dart';
import 'package:news/category/category_model.dart';

class CategoryGrid extends StatelessWidget {
  CategoryGrid({super.key, required this.selectedCategory});
  final void Function(CategoryModel) selectedCategory;

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      const CategoryModel(
        id: 'sports',
        name: 'Sports',
        image: 'ball',
        color: Color(0xffC91C22),
      ),
      const CategoryModel(
        id: 'business',
        name: 'Business',
        image: 'bussines',
        color: Color(0xffCF7E48),
      ),
      const CategoryModel(
        id: 'entertainment',
        name: 'Entertainment',
        image: 'environment',
        color: Color(0xff4882CF),
      ),
      const CategoryModel(
        id: 'science',
        name: 'Science',
        image: 'science',
        color: Color(0xffF2D352),
      ),
      const CategoryModel(
        id: 'health',
        name: 'Health',
        image: 'health',
        color: Color(0xffED1E79),
      ),
      const CategoryModel(
        id: 'technology',
        name: 'Technology',
        image: 'technology',
        color: Color(0xffC91C22),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'Pick your category of interest',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppTheme.navy),
            ),
          ),
          Expanded(
              child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
            ),
            itemBuilder: (_, index) {
              final category = categories[index];
              return GestureDetector(
                  onTap: () {
                    selectedCategory(category);
                  },
                  child: CategoryItem(
                    category: category,
                    index: index,
                  ));
            },
            itemCount: categories.length,
          ))
        ],
      ),
    );
  }
}
