import 'dart:math';

import 'package:flutter/material.dart';
import 'package:twitter/widgets/side_bar_menu.dart';

import '../screens/chats_screen.dart';
import '../screens/home_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/search_screen.dart';

class BarMenu extends StatefulWidget {
  const BarMenu({super.key});

  @override
  State<BarMenu> createState() => _BarMenuState();
}

class _BarMenuState extends State<BarMenu> {
  late int _selectedIndex = 0;

  final List<String> _titles = const [
    "Home",
    "Search",
    "Notifications",
    "Chats"
  ];

  final List<Widget> _widgetOptions = const [
    HomeScreen(),
    SearchScreen(),
    NotificationsScreen(),
    ChatsScreen(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: _titles[_selectedIndex] == "Search"
            ? SizedBox(
                height: 38,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    contentPadding: const EdgeInsets.all(0),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle:
                        TextStyle(fontSize: 14, color: Colors.grey.shade500),
                    hintText: "Search..",
                  ),
                ),
              )
            : Text(
                _titles[_selectedIndex],
                style: TextStyle(
                  color: Colors.grey[800]!,
                ),
              ),
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  elevation: 0,
                  padding: const EdgeInsets.all(0),
                ),
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://intranet.hbtn.io/assets/holberton-logo-full-default-9c9d1742abc6ffb045e9b4af78ba85770bf39126bcf2c43af9d6a53ee4aabd3d.png',
                  ),
                ),
              ),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
              color: Colors.lightBlue,
            ),
          )
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      drawer: const SideBarMenu(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: "",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
