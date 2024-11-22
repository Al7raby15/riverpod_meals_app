import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/catergories_screen.dart';
import 'package:meals_app/screens/favorite_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

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
        ScaffoldMessenger.of(context).clearSnackBars();
        favoriteList.remove(meal);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('You have removed meal from favorite!')));
      });
    } else {
      setState(() {
        ScaffoldMessenger.of(context).clearSnackBars();
        favoriteList.add(meal);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('You have added a meal to favorite!')));
      });
    }
  }

  void naviOntap(int index) {
    setState(() {
      myIndex = index;
    });
  }

  void onSelectedScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
    }
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
      appBar: AppBar(
        title: myIndex == 0
            ? const Text('Pick a Catergories')
            : const Text('Favorite List'),
      ),
      drawer: MainDrawer(
        onSelectedScreen: onSelectedScreen,
      ),
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
