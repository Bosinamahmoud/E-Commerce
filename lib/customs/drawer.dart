import 'package:ecommerce/providers/ThemeProvider.dart';
import 'package:ecommerce/providers/userProvider.dart';
import 'package:ecommerce/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget getDrawer(){
  Color c= Colors.red;
  return Consumer<Themeprovider>(builder: (context,provider,child){
    final userprovider = Provider.of<userProvider>(context);

    return
    Drawer(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){},
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(onPressed: (){ provider.toggelTheme();}, icon: Icon(Icons.dark_mode_outlined, color: c))
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: c,
                      child: Icon(Icons.person, color: Colors.white, size: 50,),
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
        ],
      ),
    ));}
  );
}
