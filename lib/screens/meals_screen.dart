import 'package:flutter/material.dart';
import 'package:food_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class MealsScreen extends StatelessWidget {
  final String id;
  final String title;

  MealsScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {

    final categoricalmeals = DUMMY_MEALS.where((e) {
      return e.categories.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(categoricalmeals[index].id,categoricalmeals[index].title, categoricalmeals[index].imageUrl, categoricalmeals[index].duration, categoricalmeals[index].complexity, categoricalmeals[index].affordability);
          
        },
        itemCount: categoricalmeals.length,
      ),
    );
  }
}
