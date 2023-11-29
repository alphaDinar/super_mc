import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:super_mc/Pages/Register/opener.dart';

class Fix extends StatefulWidget {
  const Fix({super.key});

  @override
  State<Fix> createState() => _FixState();
}

class _FixState extends State<Fix> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SpringSimulation _simulation;

  @override
  void initState() {
    super.initState();
    print('beast');

    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
        lowerBound: 0,
        upperBound: double.infinity);

    _simulation = SpringSimulation(
        SpringDescription(mass: 0.5, stiffness: 100, damping: 10), 300, 100, 0);
    _controller.animateWith(_simulation).whenComplete(() {
      print('killer');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.redAccent,
            alignment: Alignment.centerLeft,
            // child: Transform.translate(
            //   offset: Offset(0, -200),
            //   child: Container(
            //     width: 50,
            //     height: 50,
            //     color: Colors.white,
            //   ),
            //   ),
            child: TweenAnimationBuilder(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:  (context)=> Opener()));
                },
                child: Container(
              width: 50,
              height: 50,
              color: Colors.black,
            ),
              ),
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(milliseconds: 2000),
              builder: (BuildContext context, double _val, Widget? child) {
                return Transform.translate(
                    offset: Offset(0, _controller.value),
                    child: Opacity(opacity: _val, child: child));
              },
            )

            // child:
            // AnimatedBuilder(
            //     animation: _controller,
            //     builder: (BuildContext context, Widget? child) {
            //       return Transform.translate(
            //         offset: Offset(150, _controller.value),
            //         child: Container(
            //           width: 50,

            //           height: 50,
            //           decoration: BoxDecoration(

            //             color: Colors.redAccent,
            //           ),
            //         ),
            //       );
            //     }),
            ));
  }
}
