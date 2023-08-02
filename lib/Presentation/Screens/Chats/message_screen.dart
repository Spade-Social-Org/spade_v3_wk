import 'package:flutter/material.dart';

import '../../../Data/Models/chat_model.dart';
import '../../widgets/polygon_icon.dart';
import 'chat_screen.dart';




class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> with SingleTickerProviderStateMixin {
  bool showTopBar = false;
  bool isTopBarVisible = false;
  TextEditingController textEditingController = TextEditingController();
  List<Chat> filteredChats = [];
  late TabController _tabController;
  Color _selectedTabColor = Colors.red;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }



  @override
  void initState() {
    super.initState();
    filteredChats.clear(); // Clear the list initially
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_onTabChanged);
  }


  void filterChats(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredChats = dummyChatData
            .where((chat) =>
            chat.username.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredChats.clear();
      }
    });

    if (query.isEmpty) {
      filteredChats = [];
    }
  }

  void _onTabChanged() {
    setState(() {
      // Update the color based on the selected tab
      switch (_tabController.index) {
        case 0:
          _selectedTabColor = Colors.red;
          break;
        case 1:
          _selectedTabColor = Colors.green;
          break;
        case 2:
          _selectedTabColor = Colors.blue;
          break;
        default:
          _selectedTabColor = Colors.red;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            padding: EdgeInsets.zero, // Set padding to zero
            child: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              title: const Text(
                'Messages',
                // style: ,
              ),
              centerTitle: false,

              actions: [

                Row(
                  children: [
                    Container(
                      width: 35,
                      height: 40,
                      // color: Colors.red,
                      child: IconButton(
                        icon: Icon(Icons.camera_alt_outlined, color: Colors.black,),
                        onPressed: () {
                          // Handle search action
                        },
                      ),
                    ),
                    Container(
                      width: 35,
                      height: 40,
                      // color: Colors.red,
                      child: IconButton(
                        icon: Icon(Icons.people_alt_outlined, color: Colors.black,),
                        onPressed: () {
                          // Handle search action
                        },
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      // color: Colors.red,
                      child: IconButton(
                        icon: Icon(Icons.more_vert_outlined, color: Colors.black,),
                        onPressed: () {
                          // Handle search action
                        },
                      ),
                    ),
                  ],
                )
              ],
              // Other app bar properties and actions
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 8,left: 8),
                  child: Text(
                    "Top 5 picks",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: friend.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              'https://picsum.photos/id/$index/200/200',
                            ),
                          ),
                          border: Border.all(
                            color: friend[index].color,
                            width: 2,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [

                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 45,
                          width: screenWidth * 0.70,
                          color: const Color.fromRGBO(247, 244, 244, 1),
                          child: TextField(
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                            ),
                            controller: textEditingController,
                            onTap: () {
                              setState(() {
                                showTopBar = !showTopBar;
                                isTopBarVisible = showTopBar;
                              });
                            },
                            onChanged: filterChats,
                            decoration: const InputDecoration(
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 40,
                        // color: Colors.red,
                        child: IconButton(
                          icon: Icon(Icons.grid_on_outlined, color: Colors.black,),
                          onPressed: () {
                            // Handle search action
                          },
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        // color: Colors.red,
                        child: IconButton(
                          icon: Icon(Icons.tune_outlined, color: Colors.black,),
                          onPressed: () {
                            // Handle search action
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                if (isTopBarVisible)
                  DefaultTabController(
                      length: dummyChatData.length,
                      child: Column(
                        children: [
                          const TabBar(
                            tabs: [
                              Tab(
                                text: 'Single & Searching',
                              ),
                              Tab(
                                text: 'Red Light',
                              ),
                              Tab(
                                text: 'Long Term',
                              ),
                              Tab(
                                text: 'Friends',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 500,
                            child: TabBarView(children: [
                              SizedBox(
                                child: ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: filteredChats.length,
                                  itemBuilder: (context, index) {
                                    final chat = filteredChats[index];
                                    return GestureDetector(
                                      child: Card(
                                          elevation: 2,
                                          child: ChatItem(chat: chat)),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                child: ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: filteredChats.length,
                                  itemBuilder: (context, index) {
                                    final chat = filteredChats[index];
                                    return GestureDetector(
                                      child: Card(
                                          elevation: 2,
                                          child: ChatItem(chat: chat)),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                child: ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: filteredChats.length,
                                  itemBuilder: (context, index) {
                                    final chat = filteredChats[index];
                                    return GestureDetector(
                                      child: Card(
                                          elevation: 2,
                                          child: ChatItem(chat: chat)),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                child: ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: filteredChats.length,
                                  itemBuilder: (context, index) {
                                    final chat = filteredChats[index];
                                    return GestureDetector(
                                      child: Card(
                                          elevation: 2,
                                          child: ChatItem(chat: chat)),
                                    );
                                  },
                                ),
                              ),
                            ]),
                          )
                        ],
                      ))
                else
                  ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: dummyChatData.length,
                    itemBuilder: (context, index) {
                      final chat = dummyChatData[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),

                        ),
                        elevation: 3.0,
                        child: Column(
                          children: [
                            ChatItem(chat: chat),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child:    Padding(padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                child:LinearProgressIndicator(
                                  backgroundColor: Colors.grey[100],
                                  minHeight: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                                  value: 0.6, // Set the progress value between 0.0 and 1.0
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final Chat chat;

  const ChatItem({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ListTile(
        leading: Stack(
          children: [
            Container(
              width: 60,
              alignment: AlignmentDirectional.centerStart,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 25,
                backgroundImage: NetworkImage(chat.profileImageUrl),
              ),
            ),

            Positioned(
              right: 0,
              // top: 0,
              child: PolygonIcon(),

            ),

            Positioned(
              right: 11,
              top: 8,
              child: Center(
                child: Text(
                  chat.messageNotice,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ),
            )
          ],
        ),
        title: Text(
          chat.username,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(chat.lastMessage),
        trailing: Text(chat.timestamp),
        onTap: () {
          // Handle chat item tapped
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChatScreen(chat: chat)));
        },
      ),
    );
  }
}
class Friend {
  final String images;
  final Color color;

  const Friend(this.images, this.color);
}

List<Friend> friend = [
  const Friend("assets/images/Ellipse 368.png", Colors.green),
  const Friend("assets/images/Ellipse 372.png", Colors.green),
  const Friend("assets/images/Ellipse 366.png", Colors.red),
  const Friend("assets/images/Ellipse 368.png", Colors.yellow),
  const Friend("assets/images/Ellipse 368.png", Colors.green),
];