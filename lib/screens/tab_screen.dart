import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/catergories_screen.dart';
import 'package:meals_app/screens/favorite_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() {
    return _TabScreen();
  }
}

class _TabScreen extends State<TabScreen> {
  int myIndex = 0;

  List<Meal> favoriteList = [];

  void _toggleFavorite(Meal meal) {
    final isExisting = favoriteList.contains(meal);

    if (isExisting) {
      setState(() {
        favoriteList.remove(meal);
      });
    } else {
      setState(() {
        favoriteList.add(meal);
      });
    }
  }

  void naviOntap(int index) {
    setState(() {
      myIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      CatergoriesScreen(
        onToggle: _toggleFavorite,
      ),
      FavoriteScreen(
        favoriteMeals: favoriteList,
      ),
    ];
    return Scaffold(
      body: screens[myIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: naviOntap,
          currentIndex: myIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood_outlined), label: 'Catergories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite')
          ]),
    );
  }
}
