import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.filteredMeals});

  final Map<Filters, bool> filteredMeals;
  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

enum Filters {
  gultenFree,
  lactoseFree,
  vagentarianFree,
  vaganFree,
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _gultenFilterSet = false;
  bool _lactoseFreeFilter = false;
  bool _vegatarianFreeFilter = false;
  bool _vagenFreeFilter = false;

  @override
  void initState() {
    super.initState();
    _gultenFilterSet = widget.filteredMeals[Filters.gultenFree]!;
    _lactoseFreeFilter = widget.filteredMeals[Filters.lactoseFree]!;
    _vegatarianFreeFilter = widget.filteredMeals[Filters.vagentarianFree]!;
    _vagenFreeFilter = widget.filteredMeals[Filters.vaganFree]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set your filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;

          Navigator.of(context).pop({
            Filters.gultenFree: _gultenFilterSet,
            Filters.lactoseFree: _lactoseFreeFilter,
            Filters.vagentarianFree: _vegatarianFreeFilter,
            Filters.vaganFree: _vagenFreeFilter,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gultenFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _gultenFilterSet = isChecked;
                });
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only contains gluten-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilter = isChecked;
                });
              },
              title: Text(
                'lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only contains lactose-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegatarianFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  _vegatarianFreeFilter = isChecked;
                });
              },
              title: Text(
                'vegantarian-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only contains vagantarian meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vagenFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  _vagenFreeFilter = isChecked;
                });
              },
              title: Text(
                'vagan-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only contains vangan meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
