import 'package:flutter/material.dart';
import 'package:simply_tailored/screens/app_resources.dart';
import 'package:simply_tailored/screens/home/customer_pages/customer_list_page.dart';
import 'package:simply_tailored/screens/home/home_page/home_page.dart';
import 'package:simply_tailored/screens/home/more_page.dart';
import 'package:simply_tailored/screens/home/order_list_page/order_list_page.dart';

class TabView extends StatefulWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);
  final PageController _pageController = PageController();

  // @override
  // void initState() {
  //   super.initState();

  //   WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
  //     _pageController.addListener(() {
  //       _currentIndex.value = _pageController.page!.round();
  //     });
  //     if (widget._page != null) _pageController.jumpToPage(widget._page!);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              HomePage(),
              const CustomerListPage(),
              const OrderListPage(),
              const MorePage(),
            ]),
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: _currentIndex,
          builder: (context, value, child) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex.value,
              onTap: (index) {
                if (index != _currentIndex.value) {
                  _currentIndex.value = index;
                  _pageController.jumpToPage(_currentIndex.value);
                }
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.checklist), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.more_horiz), label: ''),
              ],
            );
          }),
    );

    // return CupertinoTabScaffold(
    //     tabBar: CupertinoTabBar(
    //       items: [
    //         BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
    //         BottomNavigationBarItem(icon: Icon(Icons.book), label: ''),
    //         BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: ''),
    //         BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
    //         BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: ''),
    //       ],
    //     ),
    //     tabBuilder: (context, index) {
    //       return FlutterLogo();
    //     });
  }

  @override
  void dispose() {
    _pageController.dispose();

    _currentIndex.dispose();
    super.dispose();
  }
}
