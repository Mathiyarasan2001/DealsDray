import 'package:dealsdraypvt/Screens/BottomNav/Cart.dart';
import 'package:dealsdraypvt/Screens/BottomNav/HomeScreen.dart';
import 'package:dealsdraypvt/Screens/BottomNav/deals.dart';
import 'package:dealsdraypvt/Screens/BottomNav/profile.dart';
import 'package:dealsdraypvt/Screens/Custom_widgets/categories.dart';
import 'package:flutter/material.dart';

class BottomnavigationScreen extends StatefulWidget {
  const BottomnavigationScreen({super.key});

  @override
  State<BottomnavigationScreen> createState() => _BottomnavigationScreenState();
}

class _BottomnavigationScreenState extends State<BottomnavigationScreen> {
  int Currentindex = 0;
  void Ontabbar(int index) {
    setState(() {
      Currentindex = index;
    });
  }

  List Pages = [
    Homescreen(),
    Categories(),
    DealsScreen(),
    Cart(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[Currentindex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          currentIndex: Currentindex,
          showUnselectedLabels: true,
          onTap: Ontabbar,
          showSelectedLabels: true,
          selectedLabelStyle: TextStyle(color: Colors.red),
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          selectedIconTheme: IconThemeData(color: Colors.red),
          items: [
            BottomNavigationBarItem(
                label: "Home",
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                )),
            BottomNavigationBarItem(
                label: "Categories",
                icon: Icon(
                  Icons.category_outlined,
                  size: 30,
                )),
            BottomNavigationBarItem(
                label: "Deals",
                icon: Icon(
                  Icons.handshake,
                  size: 30,
                )),
            BottomNavigationBarItem(
                label: "Cart",
                icon: Icon(
                  Icons.shopping_cart,
                  size: 30,
                )),
            BottomNavigationBarItem(
                label: "Profile",
                icon: Icon(
                  Icons.person,
                  size: 30,
                ))
          ]),
    );
  }
}
