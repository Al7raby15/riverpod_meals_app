import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key, required this.favoriteMeals});

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? const Center(
            child: Text(
              'nothing to be displayed',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          )
        : ListView.builder(
            itemCount: favoriteMeals.length,
            itemBuilder: (context, int index) => Card(
              clipBehavior: Clip.hardEdge,
              elevation: 2,
              margin: const EdgeInsetsDirectional.all(16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Stack(children: [
                FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image:
                      NetworkImage(favoriteMeals[index].imageUrl, scale: 0.1),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 44),
                      color: Colors.black54,
                      child: Column(
                        children: [
                          Text(
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            favoriteMeals[index].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                      )),
                )
              ]),
            ),
          );
  }
}
