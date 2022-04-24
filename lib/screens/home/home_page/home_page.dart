import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';
import 'package:simply_tailored/screens/app_resources.dart';
import 'package:simply_tailored/screens/home/home_page/pending_orders_list_view.dart';
import 'package:simply_tailored/screens/home/home_page/stats_card.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      GlobalKey<AnimatedCircularChartState>();

  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: CustomAppBar(),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                  child: Row(
                    children: [
                      const Text(
                        'Pending orders',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'View all',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                const PendingOrdersListView(),
                const SizedBox(height: 50),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                  child: Text(
                    'Stats',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                StatsCard(chartKey: _chartKey)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 50,
          ),
          const Spacer(),
          Container(
            height: 50,
            width: 50,
            // margin: const EdgeInsets.only(right: 24, top: 24),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 98;

  @override
  double get minExtent => 98;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
