import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopNav extends StatefulWidget {
  const TopNav({super.key});

  @override
  State<TopNav> createState() => _TopNavState();
}

class _TopNavState extends State<TopNav> {
  double _horizontalMargin = 20;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello Daniel'),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(40)),
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      size: 15,
                      color: Colors.white,
                    ),
                    Text('Ayeduase, KNUST',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontSize: 12))
                  ],
                ),
              ),
            )
          ],
        ),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(50)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset('images/super.png'),
          ),
        ),
      ],
    );
  }
}
