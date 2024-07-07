import 'package:dealsdraypvt/Services/LoginApiServices.dart';
import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  final String deviceId;
  loginScreen({super.key, required this.deviceId});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new)),
                ),
                SizedBox(
                  height: 150,
                  width: 200,
                  child: Image.asset(
                    "assets/3.png",
                    fit: BoxFit.contain,
                  ),
                ),
                CustomTabBar(
                  tabs: [
                    CustomTab(text: 'Phone'),
                    CustomTab(text: 'Email'),
                  ],
                  activeColor: const Color.fromARGB(255, 183, 18, 6),
                  inactiveColor: Colors.white,
                  backgroundColor: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(25),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: CustomTabBarView(
                    deviceId: widget.deviceId,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTabBar extends StatefulWidget {
  final List<CustomTab> tabs;
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;
  final BorderRadius borderRadius;

  const CustomTabBar({
    Key? key,
    required this.tabs,
    required this.activeColor,
    required this.inactiveColor,
    required this.backgroundColor,
    required this.borderRadius,
  }) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  late TabController _tabController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tabController = DefaultTabController.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 39,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: widget.borderRadius,
      ),
      child: Row(
        children: widget.tabs.asMap().entries.map((entry) {
          int index = entry.key;
          CustomTab tab = entry.value;
          bool isSelected = index == _tabController.index;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _tabController.index = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color:
                      isSelected ? widget.activeColor : widget.backgroundColor,
                  borderRadius: widget.borderRadius,
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                alignment: Alignment.center,
                child: Text(
                  tab.text!,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CustomTab {
  final String? text;

  CustomTab({this.text});
}

class CustomTabBarView extends StatelessWidget {
  final String deviceId;
  const CustomTabBarView({Key? key, required this.deviceId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    return TabBarView(
      children: [
        SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Glad to see you!",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Please provide your phone number",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    width: 250,
                    child: TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 14),
                          hintText: "Phone"),
                      keyboardType: TextInputType.phone,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    fixedSize: Size(200, 50),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: const Color.fromARGB(255, 191, 110, 105)),
                onPressed: () {
                  if (phoneController.text.isNotEmpty) {
                    loginApiServices().loginApiRequest(
                        phoneController.text.toString(), deviceId, context);
                  }
                },
                child: Text(
                  "SEND CODE",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              )
            ],
          )),
        ),
        SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Glad to see you!",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Please provide your Email",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    width: 250,
                    child: TextField(
                      decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 14),
                          hintText: "Email"),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    fixedSize: Size(200, 50),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: const Color.fromARGB(255, 191, 110, 105)),
                onPressed: () {},
                child: Text(
                  "SEND CODE",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              )
            ],
          )),
        ),
      ],
    );
  }
}
