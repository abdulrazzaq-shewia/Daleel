// import 'package:daleel_yemen_cairo/Home/CategoryScreenHomePage.dart';
// import 'package:daleel_yemen_cairo/HomePage.dart';
// import 'package:daleel_yemen_cairo/MyFavorite.dart';
// import 'package:flutter/material.dart';
//
// class TabsScreen extends StatefulWidget {
//   @override
//   _TabsScreenState createState() => _TabsScreenState();
// }
//
// class _TabsScreenState extends State<TabsScreen> {
//   final pages = [
//
//
//     {
//       "page": HomePage(),
//       "title": "الرئيسية",
//     },
//     {
//       "page": Myfavorite(),
//       "title": "المفضلة",
//     },
//   ];
//   int selectPageIndex = 0;
//   void selectPage(int value) {
//     setState(() {
//       selectPageIndex = value;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Center(
//             child: Text(
//               pages[selectPageIndex]["title"],
//               style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w800,
//                   fontFamily: "Cairo"),
//             ),
//           ),
//         ),
//         body: pages[selectPageIndex]["page"],
//         bottomNavigationBar: BottomNavigationBar(
//
//           onTap: selectPage,
//           backgroundColor: Theme.of(context).primaryColor,
//           selectedItemColor: Theme.of(context).accentColor,
//           unselectedItemColor: Colors.white,
//           currentIndex: selectPageIndex,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.category,
//                 color: Colors.white,
//               ),
//               title: Text(
//                 "الرئيسية",
//                 style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w800,
//                     fontFamily: "Cairo"),
//               ),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.favorite,
//                 color: Colors.pink,
//               ),
//               title: Text(
//                 "المفضلة",
//                 style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w800,
//                     fontFamily: "Cairo"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
