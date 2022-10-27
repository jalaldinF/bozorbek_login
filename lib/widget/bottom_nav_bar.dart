import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
    
}

class _BottomNavBarState extends State<BottomNavBar> {
  
  int _currentIndex = 1;
  late List<Widget> _pages ;


    @override
  void initState() {
    _pages.add(CategoryScreen());
    _pages.add(HomeScreen());
    _pages.add(SettingScreen());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
          height: kBottomNavigationBarHeight,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
                currentIndex: _currentIndex,
                backgroundColor: Colors.blue,
                selectedItemColor: Colors.white,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category), label: 'Category'),
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings_outlined), label: 'Setting')
                ]),
          ),
        ),
      
    );
  }
}
