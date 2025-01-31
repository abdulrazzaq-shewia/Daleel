import 'dart:async';
import 'package:page_view_indicator/page_view_indicator.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data {
  final String title;
  final String description;
  final String image;
  final IconData iconData;

  Data({
    @required this.title,
    @required this.description,
    @required this.image,
    @required this.iconData,
  });
}

class PView extends StatefulWidget {
  @override
  _PViewState createState() => _PViewState();
}

class _PViewState extends State<PView> {
  final PageController controller = PageController(
    initialPage: 0,
  );

  int curintIndex = 0;
  final pageIndexNotifier = ValueNotifier<int>(0);

  final List<Data> myData = [
    Data(
      title: "دليل اليمنيين الشامل في مصر",
      description: "كل مايخص المغترب اليمني في مصر",
      image: "assets/images/OnBording1.png",
      iconData: Icons.auto_stories,
    ),
    Data(
      title: "دليل اليمنيين الشامل في مصر",
      description: "مرحباً بك في تطبيقك الخدمي والاستشاري",
      image: "assets/images/OnBording2.png",
      iconData: Icons.home,
    ),
    Data(
      title: "دليل اليمنيين الشامل في مصر",
      description:
          "لاتتردد في تجرية التطبيق وإضافة ملاحظاتك لتحسين جودة التطبيق",
      image: "assets/images/OnBording3.png",
      iconData: Icons.add_location_outlined,
    ),
  ];
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 10), (timer) {
      if (curintIndex < 2) curintIndex++;
      controller.animateToPage(curintIndex,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Stack(
            children: [
              Builder(
                builder: (ctx) => PageView(
                  controller: controller,
                  children: myData
                      .map((item) => Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: ExactAssetImage(item.image),
                              fit: BoxFit.cover,
                            )),
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                margin: EdgeInsets.all(10),
                                width: width,
                                height: height / 1.7,
                                child: Card(
                                  elevation: 10,
                                  color: Colors.white.withOpacity(0.15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        item.title,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.deepOrange,
                                            fontWeight: FontWeight.w900,
                                            fontFamily: "Cairo"),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          item.description,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800,
                                              fontFamily: "Cairo"),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                  onPageChanged: (val) {
                    pageIndexNotifier.value = val;
                    setState(() {
                      curintIndex = val;
                    });
                  },
                ),
              ),
              Align(
                alignment: Alignment(0, 0.7),
                child: PageViewIndicator(
                  pageIndexNotifier: pageIndexNotifier,
                  length: myData.length,
                  normalBuilder: (animationController, index) => Circle(
                    size: 8.0,
                    color: Colors.white,
                  ),
                  highlightedBuilder: (animationController, index) =>
                      ScaleTransition(
                    scale: CurvedAnimation(
                      parent: animationController,
                      curve: Curves.ease,
                    ),
                    child: Icon(
                      Icons.star,
                      size: 25.0,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
              Builder(
                builder: (ctx) => Align(
                  alignment: Alignment(0, 0.95),
                  child: Container(
                    width: width,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: RaisedButton(
                      color: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "تخطي التعليمات",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontFamily: "Cairo"),
                      ),
                      onPressed: () async {
                        Navigator.of(ctx).pushNamed("/b");
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool("x", true);
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
//
// class Indicator extends StatelessWidget {
//   final int index;
//   Indicator(this.index);
//   @override
//   Widget build(BuildContext context) {
//
//
//
//     return Align(
//       alignment: Alignment(0, 0.7),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           buildContainer(0, index == 0 ? Colors.green : Colors.red),
//           buildContainer(1, index == 1 ? Colors.green : Colors.red),
//           buildContainer(2, index == 2 ? Colors.green : Colors.red),
//         ],
//       ),
//     );
//   }
//
//   Widget buildContainer(int i, Color color) {
//     return index == i
//         ? Icon(Icons.arrow_forward_ios, color: Colors.deepOrange)
//         : Container(
//             margin: EdgeInsets.all(5),
//             height: 10,
//             width: 10,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               shape: BoxShape.circle,
//             ),
//           );
//   }
// }
