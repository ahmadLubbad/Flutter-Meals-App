import 'package:flutter/material.dart';
import 'package:meal_app/widgets/mine_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/Filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  // @override
  // initState() {
  //   _glutenFree = widget.currentFilters['gluten'];
  //   _vegan = widget.currentFilters['vagan'];
  //   _lactoseFree = widget.currentFilters['lactose'];
  //   _vegetarian = widget.currentFilters['vegetarian'];
  //   super.initState();
  // }

  Widget buildSwitchListTile(String title, String discription,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(discription),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final Map<String, bool> selectedFilters = {
                'gluten': _glutenFree,
                'vegan': _vegan,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
              };

              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                'Gluten-Free',
                'Only include gluten-Free',
                _glutenFree,
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                'Vegan',
                'Only include Vegan',
                _vegan,
                (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                'Lactose-Free',
                'Only include Lactose-Free',
                _lactoseFree,
                (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                'Vegetarian',
                'Only include Vegetarian',
                _vegetarian,
                (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
      drawer: MineDrawer(),
    );
  }
}
