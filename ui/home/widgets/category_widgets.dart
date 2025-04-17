import 'package:flutter/material.dart';
import '../../_cors/app_colors.dart';

class CategoryWidgets extends StatelessWidget {
  final String category;
  const CategoryWidgets({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8.0,
        children: [
          Image.asset(
            "assets/categories/${category.toLowerCase()}.png",
            height: 48.0,
          ),
          Text(
            category,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
