import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/catergories_screen.dart';
import 'package:meals_app/screens/favorite_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

const kInitialFilters = {
  Filters.gultenFree: false,
  Filters.lactoseFree: false,
  Filters.vagentarianFree: false,
  Filters.vaganFree: false,
};

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

  Map<Filters, bool> _selectedFilter = kInitialFilters;

  void onSelectedScreen(String identifier) async {
    Navigator.of(context).pop();

    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filters, bool>>(
          MaterialPageRoute(builder: (ctx) =>  FiltersScreen(filteredMeals: _selectedFilter,)));

      setState(() {
        _selectedFilter = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final avaliableMeals = dummyMeals.where((meal) {
      if (_selectedFilter[Filters.gultenFree]! && meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilter[Filters.lactoseFree]! && meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilter[Filters.vagentarianFree]! && meal.isVegetarian) {
        return false;
      }
      if (_selectedFilter[Filters.vaganFree]! && meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    final List<Widget> screens = [
      CatergoriesScreen(
        onToggle: _toggleFavorite,
        avaliableMeals: avaliableMeals,
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
