import 'package:ecommerce/providers/ThemeProvider.dart';
import 'package:ecommerce/providers/userProvider.dart';
import 'package:ecommerce/remote/auth/firebase_helper.dart';
import 'package:ecommerce/screens/profile.dart';
import 'package:ecommerce/screens/start.dart';
import 'package:ecommerce/themes/app_theme.dart';
import 'package:ecommerce/classes/ScreenName.dart';
import 'package:ecommerce/screens/Cart.dart';
import 'package:ecommerce/screens/history.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/Home.dart';

Widget getDrawer() {
  Color c = Colors.red;

  return Consumer<Themeprovider>(builder: (context, provider, child) {
    final userprovider = Provider.of<userProvider>(context);
    bool isThemePressed=false;
    return Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                SizedBox(height: 30),
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          provider.toggelTheme();
                        },
                        icon: Icon(Icons.dark_mode_outlined,
                            color: Theme.of(context).primaryColor))),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 5),
                        Text("${userprovider.name}", style:TextStyle(fontWeight: FontWeight.bold)),
                        Text("  ${userprovider.email}", style:TextStyle(color: Colors.grey[400])),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          Expanded(
              child: Column(
            children: [
              ListTile(
                title: Text(
                  "Profile",
                  style:
                      TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.person),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => profile()));
                },
              ),

              ListTile(
                title: Text(
                  "Catagory",
                  style:
                  TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.filter_list_rounded),
                onTap: () {}
              ),
              ListTile(
                title: Text(
                  "History",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, ),
                ),
                trailing: Icon(Icons.history),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>history ()));
                },
              ),
              ListTile(
                title: Text(
                  "settings",
                  style:
                      TextStyle(fontWeight: FontWeight.bold,),
                ),
                trailing: Icon(Icons.settings),
                onTap: () {

                },
              )
            ],
          )),
          ListTile(
            title: Text(
              "LogOut",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
            onTap: ()async {
             await FirebaseHelper().signOut();
             Navigator.push(
                  context, MaterialPageRoute(builder: (context) => start()));
            },
          )
        ],
      ),
    ));
  });
}
