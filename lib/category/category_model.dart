import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String name;
  final String image;
  final Color color;

  const CategoryModel({
    required this.name,
    required this.image,
    required this.color,
    required this.id,
  });
}
