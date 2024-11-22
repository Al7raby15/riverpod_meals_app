import 'package:flutter/material.dart';

import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_detail.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFavorite
  });
  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: MealDetail(meal: meal)),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()=>onToggleFavorite(meal), icon: const Icon(Icons.star_border))
        ],
        title: Text(meal.title),
      ),
    );
  }
}
