// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app_with_getx/component/navigation_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyBotttomNav(),
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
