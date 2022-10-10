
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/Headlines/home_page.dart';

import '../utils/colors.dart';
import 'articles/discover_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav(
      {Key? key,})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomNav createState() => _BottomNav();
}

class _BottomNav extends State<BottomNav> {
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const Homepage(),
      const Discoverpage(),
      const Discoverpage(),
    ];
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items:const [
          BottomNavigationBarItem(
            icon:  Icon(CupertinoIcons.home,color: AppColors.darkgrey,),
            label: "",
          ),
          BottomNavigationBarItem(
            icon:  Icon(CupertinoIcons.search,color: AppColors.darkgrey,),
            label: "",
          ),
          BottomNavigationBarItem(
            icon:  Icon(Icons.person_outline_outlined,color: AppColors.darkgrey),
            label: "",
          ),
        ],
      ),
    );
  }
}