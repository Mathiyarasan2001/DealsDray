import 'package:dealsdraypvt/Services/CreateAccountApiServices.dart';
import 'package:flutter/material.dart';

class Createaccount extends StatefulWidget {
  final String userId;
  Createaccount({super.key, required this.userId});

  @override
  State<Createaccount> createState() => _CreateaccountState();
}

class _CreateaccountState extends State<Createaccount> {
  bool _isResendEnabled = false;
  bool _isPasswordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Lets Begin!",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Please enter your credential to proceed",
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
              SizedBox(
                height: 50,
                width: 250,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 14),
                      hintText: "Your Email"),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 250,
                child: TextField(
                  controller: passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 14),
                    hintText: "Create Password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 250,
                child: TextField(
                  controller: referralCodeController,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 14),
                      hintText: "Referral Code (Optional)"),
                  keyboardType: TextInputType.phone,
                ),
              ),
              SizedBox(
                height: 140,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    style: IconButton.styleFrom(
                        fixedSize: Size(55, 50),
                        backgroundColor: Color.fromARGB(255, 194, 23, 11),
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      CreateNewUserApiServices().newApiRequest(
                          emailController.text,
                          passwordController.text,
                          referralCodeController.text,
                          widget.userId,
                          context);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
