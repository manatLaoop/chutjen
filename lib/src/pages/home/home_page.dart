// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ffi';

import 'package:chutjen/src/pages/home/widget/datafor_homepage.dart';
import 'package:chutjen/style/style.dart';
import 'package:flutter/material.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  final String profile =
      'https://media.istockphoto.com/id/1391365592/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/%E0%B8%9C%E0%B8%B9%E0%B9%89%E0%B8%AB%E0%B8%8D%E0%B8%B4%E0%B8%87-afro-%E0%B8%97%E0%B8%B5%E0%B9%88%E0%B8%AA%E0%B8%A7%E0%B8%A2%E0%B8%87%E0%B8%B2%E0%B8%A1.jpg?s=612x612&w=0&k=20&c=djjRP4SdiCae4t9SfNqHfZAcGkZBcxIT2ufBwFTwiqo=';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.black12],
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return factoryItem();
            }, childCount: 1),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Column(
                children: [
                  Container(
                    child: Text('รายการอัปเดตล่าสุด'),
                  ),
                  Container(
                    child: datatable(),
                  )
                ],
              );
            }, childCount: 1),
          ),
        ],
      ),
    );

    // ignore: dead_code
  }

  SizedBox factoryItem() {
    return SizedBox(
      height: 130,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Card(
                  elevation: 5,
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: 200,
                    child: Padding(
                      padding: padding(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(profile))),
                            // child: Center(
                            //   child: Image.network(profile),
                            // ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('เพชร เจริญการเกษตร')
                        ],
                      ),
                    ),
                  ));
            }),
      ),
    );
  }

  EdgeInsets padding({double? l, double? t, double? r, double? b}) {
    return EdgeInsets.fromLTRB(l ?? 8, t ?? 10, r ?? 8, b ?? 10);
  }
}
