import 'package:ecommerce/providers/ThemeProvider.dart';
import 'package:ecommerce/providers/userProvider.dart';
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

    return Drawer(
        //backgroundColor: Colors.white,
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Column(
              children: [
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
                        Text("${userprovider.name}"),
                        Text("  ${userprovider.email}"),
                        SizedBox(height: 8),
                        Text("View Profile")
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
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
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => start()));
            },
          )
        ],
      ),
    ));
  });
}
