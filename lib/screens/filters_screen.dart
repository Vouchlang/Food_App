import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routName = '/filters-screen';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      activeColor: Colors.amber,
      value: currentValue,
      subtitle: Text(description),
      onChanged: () => updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                  title: Text('Hi'),
                  activeColor: Colors.amber,
                  value: _glutenFree,
                  subtitle: Text('Hello'),
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
              _buildSwitchListTile(
                  'Gluten-Free', 'Only include glutin-free meals.', _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              // _buildSwitchListTile(
              //     'Vegetarian', 'Only include Vegetarian meals.', _vegetarian,
              //     (newValue) {
              //   setState(() {
              //     _vegetarian = newValue;
              //   });
              // }),
              // _buildSwitchListTile('Vegan', 'Only include vegan meals.', _vegan,
              //     (newValue) {
              //   setState(() {
              //     _vegan = newValue;
              //   });
              // }),
              // _buildSwitchListTile('Lactose-Free',
              //     'Only include lactose-free meals.', _lactoseFree, (newValue) {
              //   setState(() {
              //     _lactoseFree = newValue;
              //   });
              // }),
            ],
          ))
        ],
      ),
    );
  }
}
