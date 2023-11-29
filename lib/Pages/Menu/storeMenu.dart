import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_mc/Pages/Components/topNav.dart';

class StoreMenu extends StatefulWidget {
  const StoreMenu({super.key});

  @override
  State<StoreMenu> createState() => _StoreMenuState();
}

class _StoreMenuState extends State<StoreMenu> {
  double _horizontalMargin = 20;
  double _pageMargin = 30;
  List _stores = ['Super MC', 'Uptown Foods', 'M Express'];

  List _categories = ['Drinks', 'Snacks', 'Meals', 'Drinks', 'Snacks', 'Meals'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).canvasColor,
      body: Container(
        color: Colors.white60,
        margin: EdgeInsets.only(top: _pageMargin),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: _horizontalMargin),
              child: Column(
                children: [
                  TopNav(),
                  SizedBox(height: 15),
                  Container(
                    // color: Colors.redAccent,
                    width: MediaQuery.of(context).size.width,
                    child: Text('Order Delicious Meals',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            fontFamily:
                                GoogleFonts.signikaNegative().fontFamily)),
                  ),
                  SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
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
              // margin: EdgeInsets.only(left: _horizontalMargin),
              height: 80,
              // color: Colors.redAccent,
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 1);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: Container(
                        width: 75,

                        margin: index == _categories.length - 1
                            ? EdgeInsets.symmetric(
                                horizontal: _horizontalMargin)
                            : EdgeInsets.only(left: _horizontalMargin),
                        // height: 50,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              child: Image.asset('images/burger_king.png'),
                            ),
                            Text(
                              _categories[index],
                              style: TextStyle(fontSize: 11),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
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
                      width: 200,
                      // height: 40,
                      margin: index == _stores.length - 1
                          ? EdgeInsets.symmetric(horizontal: _horizontalMargin)
                          : EdgeInsets.only(left: _horizontalMargin),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          // color: Colors.white,
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Row(
                          //   children: [
                          // Expanded(
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40)),
                            child: Text(
                              'GHC 85',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          // ),
                          //   ],
                          // ),
                          Container(
                            // color: Colors.black,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              width: 100,
                              height: 100,
                              child: Image.asset('images/sample.png'),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(context, '/storeMenu');
                              Navigator.pushNamed(context, '/register');
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
                    ;
                  },
                )),
            SizedBox(height: 20),
            Container(
                height: 140,
                // color: Colors.black,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
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
          ],
        ),
      ),
    );
  }
}
