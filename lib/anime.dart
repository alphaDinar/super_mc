import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class Anime extends StatefulWidget {
  const Anime({super.key});

  @override
  State<Anime> createState() => _AnimeState();
}

class _AnimeState extends State<Anime> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SpringSimulation _simulation;
  Color _boxColor = Colors.white;

  @override
  void initState() {
    super.initState();
    print('mega');

    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500),
        lowerBound: 0,
        upperBound: double.infinity);

    _simulation = SpringSimulation(
        SpringDescription(mass: 0.5, stiffness: 100, damping: 10),
        300,
        100,
        0);

    _controller.animateWith(_simulation).whenComplete(() {
      print('done');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.blue,
          alignment: Alignment.bottomCenter,
          child: TweenAnimationBuilder(
            duration: Duration(milliseconds: 2000),
            child: Container(
              // width: 100,
              height: 100,
              margin: EdgeInsets.all(50),
              color: Colors.white,
            ),
            tween: Tween<double>(begin: -100, end: 0),
            builder: (BuildContext context, double _val,Widget? child) {
              return Transform.translate(
                  offset: Offset(0, _val), 
                  child: child);
            },
          )),
    );
  }
}


// TweenAnimationBuilder(
//             child: AnimatedContainer(
//               // width: 100,
//               height: 100,
//               duration: Duration(milliseconds: 300),
//               color: _boxColor,
//             ),
//             duration: Duration(milliseconds: 500),
//             tween: Tween<double>(begin: 50, end: 0),
//             builder: (BuildContext context, _val, Widget? child) {
//               return Transform.translate(
//                 offset: Offset(0, _val),
//                 child: child,
//               );
//             },
//           )