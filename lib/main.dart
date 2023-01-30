import 'package:flutter/material.dart';
import './screens/favorites_screen.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/categories_meal_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.white38,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                subtitle1: TextStyle(
                    fontSize: 20, fontFamily: 'Roboto', color: Colors.white),
                subtitle2: TextStyle(
                    fontSize: 20, fontFamily: 'Roboto', color: Colors.black),
              ),
          fontFamily: 'TektonPro'),
      // home: CategoriesScreen(),
      // initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoriesMeal.routName: (ctx) => CategoriesMeal(),
        MealDetailScreen.routName: (ctx) => MealDetailScreen(),
        FavoritesScreen.routName: (ctx) => FavoritesScreen(),
        FiltersScreen.routName: (ctx) => FiltersScreen(_setFilter)
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
