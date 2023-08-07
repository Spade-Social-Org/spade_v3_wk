import 'package:flutter/material.dart';
import '../Chats/message_screen.dart';
import '../Home/home_screen.dart';
import '../Map/map_screen.dart';
import '../More_screen/more_screen.dart';

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({super.key});

  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  int _selectedPageIndex = 0;

  void _onIconTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _appPages = [
      const HomeScreen(),
      const MessageScreen(),
      const GoogleMapScreen(),
      const MoreScreen(),
    ];
    return Scaffold(
      body: Center(
        child: _appPages[_selectedPageIndex],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        // margin: EdgeInsets.fromLTRB(0, 10,0,0),
        padding: EdgeInsets.only(top: 10),
        child: BottomNavigationBar(
          useLegacyColorScheme: true,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedPageIndex,
          onTap: (index) {
            setState(() {
              _selectedPageIndex = index;
            });
          },
          backgroundColor: Colors.black,
          elevation: 8,
          selectedItemColor: Colors.white, // Set the color of the selected item
          unselectedItemColor: Colors.grey, // Set the color of unselected items
          selectedLabelStyle: const TextStyle(
            fontWeight:
                FontWeight.bold, // Set the font weight of the selected label
          ),

          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                _selectedPageIndex == 0
                    ? "assets/images/Path 748.png"
                    : "assets/images/Path 748 (1).png",
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                _selectedPageIndex == 1
                    ? "assets/images/Group 555 (2).png"
                    : "assets/images/Group 555.png",
                width: 24,
                height: 24,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                _selectedPageIndex == 2
                    ? "assets/images/Group 554 (1).png"
                    : "assets/images/Group 554.png",
                width: 24,
                height: 24,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                _selectedPageIndex == 3
                    ? "assets/images/global2.png"
                    : "assets/images/global.png",
                width: 24,
                height: 24,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                _selectedPageIndex == 4
                    ? "assets/images/Group 648.png"
                    : "assets/images/Group 648.png",
                width: 24,
                height: 24,
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
