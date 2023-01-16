// ignore_for_file: unused_import, prefer_const_constructors, unnecessary_new, non_constant_identifier_names

import 'package:flutter/material.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    /*24 is for notification bar on Android*/

    return GridView.builder(
      controller: new ScrollController(keepScrollOffset: false),
      shrinkWrap: true,
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2.0,
      ),
      // ignore: avoid_types_as_parameter_names
      itemBuilder: (BuildContext, index) {
        return ItemCard(colors: Colors.red);
      },
    );
  }

  SizedBox ItemCard({Color? colors}) {
    return SizedBox(
      child: Card(
        color: colors,
      ),
    );
  }
}
