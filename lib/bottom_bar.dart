import 'package:floating_bottom_navigation_bar/pages/home_page.dart';
import 'package:floating_bottom_navigation_bar/pages/user_analytics.dart';
import 'package:floating_bottom_navigation_bar/pages/user_profile.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int pageIndex = 0;
  final List<Widget> _tabList = [
    const HomePage(),
    const UserAnalytics(),
    const UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Floating Navigation Bar",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff27374D),
      ),
      body: Stack(
        children: [
          _tabList.elementAt(pageIndex),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Align(
              alignment: const Alignment(0.0, 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BottomNavigationBar(
                  backgroundColor: const Color(0xff27374D),
                  selectedItemColor: Colors.red,
                  unselectedItemColor: Colors.white,
                  currentIndex: pageIndex,
                  iconSize: 30,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.analytics_outlined),
                      label: "Statistics",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_2_outlined),
                      label: "Profile",
                    ),
                  ],
                  onTap: (int index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
