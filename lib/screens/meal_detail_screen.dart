// import 'dart:js';

import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final String mealid;

  Widget dynamicbox(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10)),
        height: 150,
        width: 250,
        child: child);
  }

  Widget headingdynamic(
    String text,
  ) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }

  MealDetailScreen(this.mealid);

  @override
  Widget build(BuildContext context) {
    final selectedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);
    return Scaffold(
        appBar: AppBar(
          title: Text("${selectedmeal.title}"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                width: double.infinity,
                child: Image.network(
                  selectedmeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              headingdynamic("Ingredients"),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                height: 150,
                width: 250,
                child: ListView.builder(
                  itemCount: selectedmeal.ingredients.length,
                  itemBuilder: (context, index) => Card(
                    color: Colors.lightGreen,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(selectedmeal.ingredients[index]),
                    ),
                  ),
                ),
              ),
              headingdynamic("Steps"),
              dynamicbox(ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("${index + 1}"),
                      ),
                      title: Text(selectedmeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
                
                itemCount: selectedmeal.steps.length,
              )
              ),
            ],
          ),
        ));
  }
}
