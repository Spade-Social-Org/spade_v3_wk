import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:spade_v4/Data/Models/discover_service.dart';
import 'package:spade_v4/Presentation/Screens/Discover/discover_screen.dart';
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
  bool _showOption = false;
  int card_click = 0;

  void _onIconTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _zoneClick(int index){
    if(card_click == index){
      setState(() {
        card_click = 0;
        _showOption = false;
      });

    }else{
      setState(() {
        card_click = index;
        _showOption = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _appPages = [
      const HomeScreen(),
      const MessageScreen(),
      const DiscoveryScreen(),
      const GoogleMapScreen(),
      const MoreScreen(),
    ];
    SystemUiOverlayStyle customStatusBarStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    );
    final bottomNavigationProvider = Provider.of<DiscoverService>(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: customStatusBarStyle,
      child: Scaffold(
        body: Center(
          child: _appPages[_selectedPageIndex],
        ),
        bottomNavigationBar: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 70.0,
              color: Colors.black,
            ),
            BottomNavigationBar(
              useLegacyColorScheme: true,
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedPageIndex,
              onTap: (index) {


                if(_selectedPageIndex == 2 && index == 2){
                  setState(() {
                    _showOption = true;
                    _selectedPageIndex = index;

                  });
                }else{
                  setState(() {
                    _selectedPageIndex = index;
                    _showOption = false;
                  });
                }

              },
              backgroundColor: Colors.black,
              elevation: 8,
              selectedItemColor:
              Colors.white, // Set the color of the selected item
              unselectedItemColor:
              Colors.grey, // Set the color of unselected items
              selectedLabelStyle: TextStyle(
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
                    _showOption ? 'assets/images/bottom_nav.png' :(
                        _selectedPageIndex == 2
                            ? "assets/images/Group 554 (1).png"
                            : "assets/images/Group 554.png"),
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
            if (_showOption)
              Positioned(
                bottom: 1.0,
                child: Container(
                  height: 75,
                  width: 100,
                  decoration: const BoxDecoration(
                    // color: Colors.grey,
                    image: DecorationImage(
                        image: AssetImage("assets/images/bottom_nav.png")
                    ),

                    // Half the height to make it elliptical
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned(
                          top: card_click == 1 ? 1 : 12,
                          left: 0,
                          child: GestureDetector(
                            onTap: (()=>{

                              bottomNavigationProvider.updateIndex('red'),
                            _zoneClick(1)

                            }),
                            child: Transform.rotate(
                              angle: -0.5,
                              child: Container(
                                height: card_click == 1 ? 35.0 : 20.0,
                                width: 15.0,
                                color: Colors.red,

                              ),
                            ),
                          )
                      ),
                      Positioned(
                          left: 22.0,
                          top: card_click == 2 ? -5.0 : 5.0,
                          child: GestureDetector(
                            onTap: (()=>{
                              bottomNavigationProvider.updateIndex('green'),
                              _zoneClick(2)

                            }),
                            child: Transform.rotate(
                              angle: -0.2,
                              child: Container(
                                height: card_click == 2 ? 35.0 :20.0,
                                width: 15.0,
                                color: Colors.green.shade900,

                              ),
                            ),
                          )
                      ),
                      Positioned(
                          left: 45.0,
                          top: card_click == 3 ? -5.0 : 5.0,
                          child: GestureDetector(
                            onTap: (()=>{

                              bottomNavigationProvider.updateIndex('yellow'),
                              _zoneClick(3)
                            }),
                            child: Transform.rotate(
                              angle: 0.2,
                              child: Container(
                                height: card_click == 3 ? 35.0 : 20.0,
                                width: 15.0,
                                color: Colors.yellow,

                              ),
                            ),
                          )
                      ),
                      Positioned(
                          left: 67.0,
                          top: card_click == 4 ? 0.0 : 12.0,
                          child: GestureDetector(
                            onTap: (()=>{
                              bottomNavigationProvider.updateIndex('grey'),
                              _zoneClick(4)
                            }),
                            child: Transform.rotate(
                              angle: 0.5,
                              child: Container(
                                height: card_click == 4 ? 35.0 : 20.0,
                                width: 15.0,
                                color: Colors.grey,

                              ),
                            ),
                          )
                      ),
                      Positioned(
                          left: 35.0,
                          top: 40.0,
                          child: GestureDetector(
                            onTap: (()=>{
                              if(_showOption){
                                setState(()=>{
                                  _showOption = !_showOption
                                })
                              }

                            }),
                            child: Transform.rotate(
                              angle: 0.0,
                              child: Container(
                                height: 15.0,
                                width: 15.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,

                                ),

                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
