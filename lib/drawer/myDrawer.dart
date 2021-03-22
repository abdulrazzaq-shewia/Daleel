import 'dart:io';

import 'package:daleel_yemen_cairo/HomePage.dart';
import 'package:daleel_yemen_cairo/MyFavorite.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // UserAccountsDrawerHeader(
          //   accountEmail: Text(
          //     ('Marzouq@gmail.com'),
          //     textScaleFactor: 1.5,
          //   ),
          //   accountName: Text(
          //     ('Marzouq'),
          //     textScaleFactor: 1.5,
          //   ),
          //   currentAccountPicture: CircleAvatar(
          //     child: Icon(Icons.person),
          //   ),
          //   decoration: BoxDecoration(
          //       color: Colors.cyan,
          //       image: DecorationImage(
          //           image: AssetImage('images/drawer.jpg'), fit: BoxFit.cover)),
          // ),
          ListTile(
            title: Text(
              ' الرئيسية',
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
            leading: Icon(Icons.home, color: Colors.green),

            onTap: () {
              final route =
              MaterialPageRoute(builder: (context) => HomePage());
              Navigator.push(context, route);
            },

            /*
                                    trailing: Icon(Icons.tune),
                                    subtitle: Text('الصفحة الرئيسية'),
                                      isThreeLine: true,
                                       dense: true,
                                       contentPadding: EdgeInsets.all(10),
                    */
          ),
          ListTile(
            title: Text(
              ' المفضلة',
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
            leading: Icon(Icons.favorite, color: Colors.red, size: 30),

            onTap: () {
              final route =
              MaterialPageRoute(builder: (context) => Myfavorite());
              Navigator.push(context, route);
            },
          ),
          // ListTile(
          //   title: Text(' الاقسام',
          //       style: TextStyle(color: Colors.blue, fontSize: 18)),
          //   leading: Icon(Icons.category, color: Colors.blue, size: 30),
          //   onLongPress: () {
          //     print('longPress');
          //   },
          //   onTap: () {
          //     Navigator.of(context).pushNamed('categories');
          //   },
          // ),
          // Divider(color: Colors.brown, height: 6, thickness: 2),
          // ListTile(
          //   title: Text(
          //     ' تطبيقاتنا',
          //     style: TextStyle(color: Colors.blue, fontSize: 18),
          //   ),
          //   leading: Icon(Icons.apps, color: Colors.amber, size: 30),
          //   onLongPress: () {
          //     print('longPress');
          //   },
          //   onTap: () {
          //     print('tap');
          //   },
          // ),

          // ListTile(
          //   title: Text(
          //     ' الاعدادات',
          //     style: TextStyle(color: Colors.blue, fontSize: 18),
          //   ),
          //   leading: Icon(Icons.settings, color: Colors.amber, size: 30),
          //   onLongPress: () {
          //     print('longPress');
          //   },
          //   onTap: () {
          //     Navigator.of(context).pushNamed('setting');
          //   },
          // ),
          ListTile(
            title: Text(
              ' تسجيل الخروج',
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
            leading: Icon(Icons.exit_to_app, color: Colors.red, size: 30),
            onLongPress: () {
              print('longPress');
            },
            onTap: () {
              Future.delayed(const Duration(milliseconds: 1000), () {
                exit(0);
              });
            },
          ),
        ],
      ),
    );
  }
}
