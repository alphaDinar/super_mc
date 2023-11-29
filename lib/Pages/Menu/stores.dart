import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_mc/Pages/Components/topNav.dart';

class Stores extends StatefulWidget {
  const Stores({super.key});

  @override
  State<Stores> createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  double _horizontalMargin = 20;
  double _pagePadding = 30;
  List _stores = ['Super MC', 'Uptown Foods', 'M Express'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).canvasColor,
      body: Container(
        color: Colors.white60,
        padding: EdgeInsets.symmetric(vertical: _pagePadding),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: _horizontalMargin),
              child: Column(
                children: [
                  TopNav(),
                  SizedBox(height: 15),
                  Text('Where Do You Want To Eat Today?',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          fontFamily:
                              GoogleFonts.signikaNegative().fontFamily)),
                  SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.all(10),
                    height: 55,
                    alignment: Alignment.center,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search),
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                                fontSize: 15, decoration: TextDecoration.none),
                            decoration: InputDecoration(
                                hintText: 'Search Restaurant',
                                constraints: BoxConstraints(
                                    maxHeight: 40, minHeight: 40),
                                contentPadding: EdgeInsets.all(10),
                                border: InputBorder.none),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.tune,
                            size: 25,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
                height: 140,
                // color: Colors.black,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                // margin: EdgeInsets.only(left: 25),
                // margin: EdgeInsets.symmetric(horizontal: _horizontalMargin),
                child: PageView.builder(
                  itemCount: _stores.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      margin:
                          EdgeInsets.symmetric(horizontal: _horizontalMargin),
                      // margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            child: Image.asset('images/baby1.png'),
                          )
                        ],
                      ),
                    );
                  },
                )),
            SizedBox(height: 20),
            Container(
                // margin: EdgeInsets.only(left: _horizontalMargin),
                height: 220,
                // color: Colors.black,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 1,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: _stores.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 180,
                      // height: 40,
                      margin: EdgeInsets.only(left: 20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: index == 0
                              ? Theme.of(context).primaryColorLight
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_stores[index],
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily:
                                      GoogleFonts.signikaNegative().fontFamily),
                              textAlign: TextAlign.center),
                          Container(
                            width: 100,
                            height: 100,
                            child: Image.asset('images/logo.png'),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/storeMenu');
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Theme.of(context).cardColor),
                              child: Icon(
                                Icons.arrow_outward,
                                size: 30,
                                color: Colors.white70,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }

}
