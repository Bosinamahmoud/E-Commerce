import 'package:ecommerce/providers/ThemeProvider.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:ecommerce/screens/signUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class start extends StatelessWidget {
   start({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             /* CupertinoSwitch(
                onChanged: (value) {
                  provider.toggelTheme();
                },
                value: provider.isLight,
              ),*/
              Center(
                  child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3), // التظليل
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.shopping_bag, // استخدم الرمز المناسب
                    color: Colors.red,
                    size: 100,
                  ),
                ),
              )),
              SizedBox(height: 20),
              Text(
                "Shoppe",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 60),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => signUp()));
                    // Action to perform when button is pressed
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    "Let's get started",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              //SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("I already have an account"),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => login()));
                      },
                      icon: Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.red,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
