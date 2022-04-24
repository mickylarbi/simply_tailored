import 'package:flutter/material.dart';
import 'package:simply_tailored/screens/app_resources.dart';
import 'package:simply_tailored/screens/shared/custom_buttons.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: kBackgroundColor,
          pinned: true,
          elevation: 0,
          expandedHeight: 100,
          collapsedHeight: 80,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text(
              'More',
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
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'John Doe',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'johndoe@gmail.com',
                  style: TextStyle(color: Colors.grey),
                ),
                TextButton(
                  child: const Text(
                    'Edit profile',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {},
                ),
                const Divider(
                  height: 40,
                ),
                const ListTile(
                  leading: Icon(Icons.clear),
                  title: Text('Clear data'),
                ),
                const ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('About'),
                ),
                const ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Sign out'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
