import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double _width = 200;
  bool toggled = false;
  Color _barColor = Colors.green;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // color: Colors.black,
        // alignment: Alignment.center,
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 50,
              width: _width,
              decoration: BoxDecoration(
                  color: _barColor, borderRadius: BorderRadius.circular(40)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (toggled) {
                          _width = 200;
                          toggled = false;
                          _barColor = Colors.redAccent;
                        } else {
                          _width = 300;
                          toggled = true;
                          _barColor = Colors.blueAccent;
                        }
                      });
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.amberAccent,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 100,
              height: 50,
            ),
            TweenAnimationBuilder(
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/fix');
                },
                color: Colors.redAccent,
                style: IconButton.styleFrom(backgroundColor: Colors.white),
                icon: Icon(Icons.task_alt),
              ),
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(milliseconds: 5000),
              builder: (BuildContext context, double _val, Widget? child) {
                return Opacity(opacity: _val, child: child);
              },
              onEnd: () {
                // Animation completed
              },
            ),
          ],
        ),
      ),
    );
  }
}
