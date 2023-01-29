import 'package:flutter/material.dart';
import '../dummydata.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoriesMeal extends StatefulWidget {
  static const routName = '/categories-meal';

  @override
  State<CategoriesMeal> createState() => _CategoriesMealState();
}

class _CategoriesMealState extends State<CategoriesMeal> {
  late String catTitle;
  late List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routesArg = ModalRoute.of(context)?.settings.arguments as Map;
      catTitle = routesArg['title'];
      final catId = routesArg['id'];

      displayedMeals = DUMMY_MEAL.where((meal) {
        return meal.categories.contains(catId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            catTitle,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        body: ListView.builder(
          itemCount: displayedMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
              removeItem: _removeMeal,
            );
          },
        ));
  }
}
