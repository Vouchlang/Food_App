import 'package:flutter/material.dart';
import 'package:food_app/screens/categories_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({required this.id, required this.title, required this.color});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoriesMeal.routName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //     colors: [Colors.amber, color],
            //     begin: Alignment.topRight,
            //     end: Alignment.bottomRight),
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            )),
      ),
    );
  }
}
