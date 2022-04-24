import 'package:flutter/material.dart';
import 'package:simply_tailored/screens/app_resources.dart';
import 'package:simply_tailored/screens/shared/custom_textformfield.dart';

class CustomerListPage extends StatefulWidget {
  const CustomerListPage({Key? key}) : super(key: key);

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
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
                'Customer',
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
                  const SearchTextFormField(hintText: 'Search customer'),
                  const Divider(height: 48),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 20,
                    itemBuilder: (context, index) => ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        // margin: const EdgeInsets.only(right: 24, top: 24),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      title: const Text('Ama Jessica'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      indent: 80,
                      endIndent: 24,
                      // thickness: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SliverList(
          //   delegate: SliverChildListDelegate(
          //     [],
          //   ),
          // )
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
