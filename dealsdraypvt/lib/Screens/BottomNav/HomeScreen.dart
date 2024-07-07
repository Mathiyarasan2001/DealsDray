import 'package:dealsdraypvt/Screens/Custom_widgets/Banner1.dart';
import 'package:dealsdraypvt/Screens/Custom_widgets/KycPending.dart';
import 'package:dealsdraypvt/Screens/Custom_widgets/categories.dart';
import 'package:dealsdraypvt/Screens/Custom_widgets/exclusive.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
        ],
        title: SizedBox(
          height: 45,
          width: 250,
          child: TextField(
            decoration: InputDecoration(
                hintText: "Search here",
                hintStyle: TextStyle(color: Colors.grey),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                prefixIcon: Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage("assets/2.png"))),
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 227, 221, 221),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey))),
          ),
        ),
      ),
      floatingActionButton: TextButton.icon(
        style: TextButton.styleFrom(
            fixedSize: Size(100, 30), backgroundColor: Colors.red),
        onPressed: () {},
        label: Text(
          "Chat",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        icon: Icon(
          Icons.message_rounded,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Banner1(),
            kycPending(),
            SizedBox(
              height: 10,
            ),
            Categories(),
            Exclusive()
          ],
        ),
      ),
    );
  }
}
