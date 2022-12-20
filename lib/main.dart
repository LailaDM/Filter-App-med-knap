import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Filter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _idDayWeek = 'Tues';

  @override
  Widget build(BuildContext context) {
    final dayOfWeekMeals = meals
        .where((meal) =>
            meal.idDayWeek.any((idDayWeek) => idDayWeek == _idDayWeek))
        .toList();

    return Scaffold(
      appBar: AppBar(
          title: const Text('Menu Card'), backgroundColor: Colors.purple),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: dayOfWeekMeals.length,
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 0,
                  margin: (index == dayOfWeekMeals.length - 1)
                      ? const EdgeInsets.only(bottom: 0, left: 20, right: 20)
                      : const EdgeInsets.only(left: 20, right: 20),
                  child: ClipRRect(
                    borderRadius: (index == 0)
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          )
                        : (index == dayOfWeekMeals.length - 1)
                            ? const BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              )
                            : BorderRadius.circular(0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(dayOfWeekMeals[index].description),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WeekButton(
                'Tuesday',
                onPressed: () => setState(() => _idDayWeek = 'Tues'),
                selected: _idDayWeek == 'Tues',
              ),
              WeekButton(
                'Wednesday',
                onPressed: () => setState(() => _idDayWeek = 'Wed'),
                selected: _idDayWeek == 'Wed',
              ),
              WeekButton(
                'Thursday',
                onPressed: () => setState(() => _idDayWeek = 'Thurs'),
                selected: _idDayWeek == 'Thurs',
              ),
              WeekButton(
                'Friday',
                onPressed: () => setState(() => _idDayWeek = 'Fri'),
                selected: _idDayWeek == 'Fri',
              ),
              WeekButton(
                'Saturday',
                onPressed: () => setState(() => _idDayWeek = 'Sat'),
                selected: _idDayWeek == 'Sat',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WeekButton extends StatelessWidget {
  final String text;
  final bool? selected;
  final VoidCallback onPressed;
  const WeekButton(
    this.text, {
    Key? key,
    required this.onPressed,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        '$text \n____________',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 11,
          color:
              selected == true ? Theme.of(context).colorScheme.primary : null,
          fontWeight: selected == true ? FontWeight.bold : null,
        ),
      ),
    );
  }
}

class Meal {
  final String id;
  final String description;
  final List<String> ingredients;
  final List<String> idDayWeek;
  final String imageUrl;

  const Meal({
    required this.id,
    required this.description,
    required this.ingredients,
    required this.idDayWeek,
    required this.imageUrl,
  });
}

var id = 0;

final meals = [
  Meal(
    id: '${++id}',
    description: 'Tacos',
    ingredients: [],
    idDayWeek: ['Tues'],
    imageUrl: '',
  ),
  Meal(
    id: '${++id}',
    description: 'Pizza',
    ingredients: [],
    idDayWeek: ['Sat', 'Thurs'],
    imageUrl: '',
  ),
  Meal(
    id: '${++id}',
    description: 'Pasta carbonára',
    ingredients: [],
    idDayWeek: ['Tues', 'Fri'],
    imageUrl: '',
  ),
  Meal(
    id: '${++id}',
    description: 'Ground Beef and Potatoes',
    ingredients: [],
    idDayWeek: ['Tues', 'Wed'],
    imageUrl: '',
  ),
  Meal(
    id: '${++id}',
    description: 'Tortilla wraps',
    ingredients: [],
    idDayWeek: ['Tues', 'Wed'],
    imageUrl: '',
  ),
  Meal(
    id: '${++id}',
    description: 'Ice cream with berries',
    ingredients: [],
    idDayWeek: ['Tues', 'Wed', 'Thurs', 'Fri', 'Sat'],
    imageUrl: '',
  ),
  Meal(
    id: '${++id}',
    description: 'Banana split',
    ingredients: [],
    idDayWeek: ['Tues', 'Wed', 'Thurs', 'Fri', 'Sat'],
    imageUrl: '',
  ),
  Meal(
    id: '${++id}',
    description: 'Pancakes with cream and toppings',
    ingredients: [],
    idDayWeek: ['Tues', 'Wed', 'Thurs', 'Fri', 'Sat'],
    imageUrl: '',
  ),
  Meal(
    id: '${++id}',
    description: 'All you can eat salad bar',
    ingredients: [],
    idDayWeek: ['Tues', 'Wed', 'Thurs', 'Fri', 'Sat'],
    imageUrl: '',
  ),
];
