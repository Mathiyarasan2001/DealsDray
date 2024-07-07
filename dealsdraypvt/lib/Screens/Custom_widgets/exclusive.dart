import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Exclusive extends StatefulWidget {
  const Exclusive({super.key});

  @override
  State<Exclusive> createState() => _ExclusiveState();
}

class _ExclusiveState extends State<Exclusive> {
  List<dynamic> categories_listing = [];

  Future<void> fetchData() async {
    String apiUrl =
        'http://devapiv4.dealsdray.com/api/v2/user/home/withoutPrice';

    try {
      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        setState(() {
          categories_listing = jsonData['data']['categories_listing'];
        });
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          height: 450,
          width: 500,
          color: Color.fromARGB(255, 47, 176, 190),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "EXCLUSIVE FOR YOU",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              Container(
                height: 330,
                width: 500,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categories_listing.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        width: 180,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 05),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        height: 20,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                        child: Center(
                                          child: Text(
                                            "${categories_listing[index]['offer']} off",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Image.network(
                                      categories_listing[index]['icon']),
                                ],
                              ),
                              Text(categories_listing[index]['label']),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
