import 'package:flutter/material.dart';

class Test2 extends StatefulWidget {
  const Test2({super.key});

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  PageController _pageController = PageController();
  List _screens = ['alpha', 'beta', 'omega'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView.builder(
            controller: _pageController,
            itemCount: _screens.length,
            itemBuilder: (context, index) {
              return Container(
                  color: index == 0 ? Colors.blue : Colors.redAccent,
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      if (index < _screens.length - 1) {
                        _pageController.animateToPage(index + 1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInExpo);
                        print('mo');
                      } else {
                        Navigator.pushNamed(context, '/');
                      }
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Text('absynth'),
                      color: Colors.white,
                    ),
                  ));
            }),
      ),
    );
  }
}
