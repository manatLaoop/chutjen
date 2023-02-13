// ignore_for_file: avoid_web_libraries_in_flutter, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:chutjen/src/pages/home/addProduct_page.dart';
import 'package:chutjen/src/pages/home/home_page.dart';
import 'package:chutjen/src/pages/home/overview_page.dart';
import 'package:chutjen/src/pages/widget/Appbar.dart';
import 'package:chutjen/src/pages/widget/drawer.dart';
import 'package:chutjen/style/style.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Index_page extends StatefulWidget {
  const Index_page({Key? key}) : super(key: key);

  @override
  State<Index_page> createState() => _Index_pageState();
}

class _Index_pageState extends State<Index_page> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(centerTitle: true, fontWeight: FontWeight.bold, action: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications, size: 30),
        )
      ]),
      body: contentItem[_selectedIndex],
      drawer: SafeArea(
        child: drawer(context: context),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าแรก',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.query_stats),
            label: 'ภาพรวม',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'ค้นหา',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'อัปเดตราคา',
            backgroundColor: Colors.green,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }

  final List contentItem = [
    Home_page(),
    OverviewPage(),
    Container(
      child: Text('2'),
    ),
    AddProduct(),
  ];

  List<BottomNavigationBarItem> menubuttomItem = [];
}
