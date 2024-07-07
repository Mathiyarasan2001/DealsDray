import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Banner1 extends StatefulWidget {
  const Banner1({super.key});

  @override
  State<Banner1> createState() => _Banner1State();
}

class _Banner1State extends State<Banner1> {
  List banner = [];

  Future<void> fetchData() async {
    String apiUrl =
        'http://devapiv4.dealsdray.com/api/v2/user/home/withoutPrice';

    try {
      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        setState(() {
          banner = jsonData['data']['banner_one'];
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
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: banner.length,
        itemBuilder: (context, index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(banner[index]["banner"]))),
              ),
            ),
          );
        },
      ),
    );
  }
}
