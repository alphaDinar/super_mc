import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  PageController _pageController = PageController();
  late AnimationController _infoBoxAnimation;
  late SpringSimulation _simulation;

  List _screens = [
    {
      'img': 'images/mural1.jpg',
      'h1': 'Quick Delivery At your Door Step',
      'p': 'Food is just a tap away.'
    },
    {
      'img': 'images/mural2.jpg',
      'h1': 'Delicious Delights at Your Fingertips',
      'p': 'A Culinary Adventure Awaits.'
    },
    {
      'img': 'images/mural3.jpg',
      'h1': 'From Appetizers to Desserts',
      'p': 'Explore Endless Options'
    },
  ];

  final seperator = SizedBox(height: 15);
  double _height = 50;

  double _pageCount = 0;

  @override
  void initState() {
    super.initState();
    _infoBoxAnimation = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 3000),
        lowerBound: 0,
        upperBound: double.infinity);

    _simulation = SpringSimulation(
        SpringDescription(mass: 0.5, stiffness: 50, damping: 10), 350, 0, 0);
    _infoBoxAnimation.animateWith(_simulation).whenComplete(() {
      print('killer');
      _infoBoxAnimation.value = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: PageView.builder(
            controller: _pageController,
            itemCount: _screens.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                      // alignment: Alignment.center,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        image: DecorationImage(
                            image: AssetImage(_screens[index]['img']),
                            fit: BoxFit.cover),
                      ),
                      child: TweenAnimationBuilder(
                        child: infoBox(context, index),
                        tween: Tween<double>(begin: 0.5, end: 1),
                        duration: Duration(milliseconds: 1000),
                        builder:
                            (BuildContext context, double _val, Widget? child) {
                          return Transform.translate(
                              offset: Offset(0, _infoBoxAnimation.value),
                              child: Opacity(opacity: _val, child: child));
                        },
                      )),
                  Visibility(
                    visible: index < 2 ? true : false,
                    child: Positioned(
                        top: 30,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Skip'),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ],
              );
            }));
  }

  Column infoBox(BuildContext context, index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
                padding:
                    EdgeInsets.only(left: 25, right: 25, top: 40, bottom: 20),
                decoration: BoxDecoration(
                  // color: Theme.of(context).primaryColorLight,
                  color: Colors.white,
                  // color: Colors.black,
                  // color: index == 0 ? Theme.of(context).primaryColorLight : index == 1 ? Theme.of(context).primaryColor : index == 2 ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _screens[index]['h1'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: GoogleFonts.signikaNegative().fontFamily,
                          fontSize: 20,
                          // color: Colors.white70,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      _screens[index]['p'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 10,
                          color: Theme.of(context).primaryColorDark),
                    ),
                    seperator,
                    GestureDetector(
                      onTap: () {
                        if (index < _screens.length - 1) {
                          _pageController.animateToPage(index + 1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.bounceOut);
                        } else {
                          Navigator.pushNamed(context, '/register');
                          // Navigator.pushNamed(context, '/test');
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          index < 2 ? 'continue' : 'Get started',
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                )),
            Positioned(
                top: -35,
                child: GestureDetector(
                  onTap: () {
                    _height = 200;
                    print('0mar');
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 1000),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: index == 0
                          ? Theme.of(context).primaryColorLight
                          : index == 1
                              ? Theme.of(context).primaryColor
                              : index == 2
                                  ? Colors.black
                                  : Colors.white,

                      // color: Theme.of(context).primaryColorLight,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                )),
            Positioned(
              right: 25,
              bottom: 25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 3; i++)
                    Container(
                      width: 6,
                      height: 6,
                      margin: EdgeInsets.symmetric(vertical: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: i == (index)
                              ? Colors.grey
                              : Theme.of(context).primaryColorDark),
                    ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  // Container headBox(index) {
  //   return Container(
  //     alignment: Alignment.bottomCenter,
  //     // child: Image.asset(
  //     //   'images/super.png',
  //     //   scale: 0.8,
  //     // ),
  //   );
  // }
}
