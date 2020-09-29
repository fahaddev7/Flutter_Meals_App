import 'package:flutter/material.dart';
import 'package:food_app/screens/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(
    this.id,
    this.title,
    this.color,
  );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MealsScreen(id,title),)),
          child: Card(
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title),
        ),color: color,
      ),
    );
  }
}
