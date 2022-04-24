import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simply_tailored/screens/home/home_page/home_page.dart';

class TabView extends StatefulWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.checklist_rounded),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_rounded),
            ),
          ],
        ),
        tabBuilder: tabBuilder,
      ),
    );
  }

  Widget tabBuilder(BuildContext context, int index) {
    return <Widget>[
      HomePage(),
      CupertinoPageScaffold(
        child: Column(),
      ),
      CupertinoPageScaffold(
        child: Column(),
      ),
      CupertinoPageScaffold(
        child: Column(),
      ),
    ][index];
  }
}
