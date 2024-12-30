import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medcall/util/color.dart';

class NavBarScreen extends StatefulWidget {
  @override
  _NavBarScreenState createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: ScreenColor.white,
        selectedItemColor: ScreenColor.color6,
        unselectedItemColor: ScreenColor.color2,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.clock),
            label: 'Заявки',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.notification),
            label: 'Уведомления',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.user),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}