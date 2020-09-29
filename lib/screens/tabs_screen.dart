import 'package:flutter/material.dart';
import 'package:food_app/screens/category_screen.dart';
import 'package:food_app/screens/favourites_screen.dart';

class Tabbar extends StatefulWidget {
  @override
  _TabbarState createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  final List<Map<String, Object>> pageslist = [
    {"pages": CategoryScreen(), "title": "Categories"},
    {"pages": FavouritesScreen(), "title": "Your Favourites"},
  ];

  int selectedpageindex = 0;
  void selectpage(int index) {
    setState(() {
      selectedpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageslist[selectedpageindex]["title"]),
      ),
      body: pageslist[selectedpageindex]["pages"],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white70,
        currentIndex: selectedpageindex,
        
        onTap: selectpage,
        backgroundColor: Colors.pink,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              title: Text("Categories")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              title: Text("Favourites")),
        ],
      ),
    );
  }
}
