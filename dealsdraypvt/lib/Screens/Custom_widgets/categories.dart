import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<dynamic> categories = [];

  Future<void> fetchData() async {
    String apiUrl =
        'http://devapiv4.dealsdray.com/api/v2/user/home/withoutPrice';

    try {
      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        setState(() {
          categories = jsonData['data']['category'];
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
    return Center(
      child: SizedBox(
        height: 100,
        width: 500,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(categories[index]['icon']),
                    Text(categories[index]['label']),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
