import 'package:flutter/material.dart';
import 'package:simply_tailored/screens/app_resources.dart';
import 'package:simply_tailored/screens/home/home_page/pending_orders_list_view.dart';
import 'package:simply_tailored/screens/shared/custom_textformfield.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({Key? key}) : super(key: key);

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: kBackgroundColor,
            pinned: true,
            elevation: 0,
            expandedHeight: 100,
            collapsedHeight: 80,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                'Orders',
                style: TextStyle(color: Colors.black),
              ),
              titlePadding: EdgeInsets.symmetric(vertical: 24, horizontal: 48),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SearchTextFormField(hintText: 'Search order'),
                  const Divider(height: 48),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 20,
                    itemBuilder: (context, index) => ListTile(
                      title: const Text('Ama Jessica and Afful Joel'),
                      subtitle: const Text('- Slit and Kaba\n- Pant Suit'),
                      isThreeLine: true,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          PictureStack(
                            pictureSize: 40,
                            pictures: [
                              Colors.green,
                              Colors.red,
                              Colors.blue,
                              Colors.pink,
                              Colors.yellow
                            ],
                          ),
                          SizedBox(width: 20),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      indent: 14,
                      endIndent: 24,
                      // thickness: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
