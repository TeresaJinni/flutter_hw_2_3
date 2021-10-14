import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'home/home.dart';
import 'mine/mine.dart';
import 'drawer.dart';
import 'category/category.dart';
import 'cart/cart.dart';
import '../utils/g.dart';

class IndexPage extends StatefulWidget {
  int currentIndex = 0;

  IndexPage({Key? key, int this.currentIndex = 0}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      icon: Icon(Icons.home),
      label: G.getLocalText('Home'),
      //label: "首页",
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.green,
      icon: Icon(Icons.category),
      label: G.getLocalText('Category'),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.amber,
      icon: Icon(Icons.shopping_cart),
      label: G.getLocalText('Cart'),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.red,
      icon: Icon(Icons.person),
      label: G.getLocalText('MyPage'),
    ),
  ];

  final pages = [
    Home(),
    Category1(),
    Cart(),
    Mine()

    //   child: Text("Message", style: TextStyle(fontSize: 50)),
    // ),
    // Center(
    //   child: Text("Cart", style: TextStyle(fontSize: 50)),
    // ),
    // Center(
    //   child: Text("Profile", style: TextStyle(fontSize: 50)),
    // ),
  ];

  // int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    G.setLocal(true);
  }

  Widget portraitMode() {
    print("portraitMode");
    return Scaffold(
      appBar: AppBar(
        title: Text(bottomNavItems[widget.currentIndex].label.toString()),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: _handleClick,
            itemBuilder: (BuildContext context) {
              return {'中文', 'English'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
          SizedBox(width: 15),
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: MyDrawer(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: bottomNavItems,
          currentIndex: widget.currentIndex,
          type: BottomNavigationBarType.fixed,
          //type: BottomNavigationBarType.shifting,
          onTap: (index) {
            _changePage(index);
          }
      ),
      body: pages[widget.currentIndex],
    );
  }

  Widget landscapeMode() {
    print("landscapeMode");
    return Scaffold(
      appBar: AppBar(
        title: Text(bottomNavItems[widget.currentIndex].label.toString()),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: _handleClick,
            itemBuilder: (BuildContext context) {
              return {'中文', 'English'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
          SizedBox(width: 15),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: bottomNavItems,
          currentIndex: widget.currentIndex,
          type: BottomNavigationBarType.fixed,
          //type: BottomNavigationBarType.shifting,
          onTap: (index) {
            _changePage(index);
          }
      ),
      body: pages[widget.currentIndex],
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) {
      return orientation == Orientation.landscape
          ? landscapeMode() : portraitMode();
    });
  }

  void _changePage(int index) {
    if (index != widget.currentIndex) {
      setState(() {
        widget.currentIndex = index;
      });
    }
  }

  void _handleClick(String value) {
    print("handleClick(): Changed to " + value);
    switch (value) {
      case '中文':
          G.setLocal(false);
        break;
      case 'English':
          G.setLocal(true);
        break;
    }

    rebuildAllChildren(context);
  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }
    (context as Element).visitChildren(rebuild);
  }
}