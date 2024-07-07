import 'package:flutter/material.dart';

class kycPending extends StatelessWidget {
  const kycPending({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        width: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xff575dcf)),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "KYC Pending",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              Column(
                children: [
                  Text(
                    "you to provide the required",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "document for your account activation.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Click Here",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
