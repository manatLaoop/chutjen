// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

String imgProfie =
    'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60';

Drawer drawer() {
  return Drawer(
    child: Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        headerProfile(),
        ListTile(
          leading: Icon(Icons.manage_accounts),
          title: Text('จัดการบัญชีของฉัน'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.manage_accounts),
          title: Text('จัดการบัญชีของฉัน'),
          onTap: () {},
        ),
        Spacer(),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('ออกจากระบบ'),
          onTap: () {},
        ),
      ],
    ),
  );
}

UserAccountsDrawerHeader headerProfile() {
  return UserAccountsDrawerHeader(
    currentAccountPicture: CircleAvatar(
      backgroundImage: NetworkImage(imgProfie),
    ),
    decoration: BoxDecoration(
        image: DecorationImage(
      fit: BoxFit.cover,
      image: NetworkImage(imgProfie),
    )),
    accountName: Container(
      decoration: BoxDecoration(
        color: Colors.amber,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5, top: 5, left: 8, right: 8),
        child: Text('manat'),
      ),
    ),
    accountEmail: Container(
      decoration: BoxDecoration(
        color: Colors.amber,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5, top: 5, left: 8, right: 8),
        child: Text('manatlaoop@gmail.com'),
      ),
    ),
  );
}
