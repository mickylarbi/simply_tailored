import 'package:flutter/material.dart';
import 'package:simply_tailored/screens/app_resources.dart';
import 'package:simply_tailored/screens/home/customer_pages/customer_details_screen.dart';
import 'package:simply_tailored/screens/shared/custom_buttons.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Edit Order',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(48),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Deadline',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('22nd February 2022'),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.calendar_month, color: Colors.blue),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Container(
            width: 260,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 30,
                  color: Colors.black.withOpacity(.1),
                )
              ],
              color: kBackgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Customers',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    CustomTextButton(
                      labelText: 'Edit ',
                      onPressed: () {},
                    ),
                  ],
                ),
                ...['Ama Jones', 'Jessica Arthur']
                    .map(
                      (e) => ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        title: Text(e),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.chevron_right),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CustomerDetailsScreen()));
                        },
                      ),
                    )
                    .toList(),
                const Divider(
                  thickness: 2,
                  height: 40,
                ),
                const Text(
                  'Items',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...['Pant suit', 'Slit and Kaba']
                    .map(
                      (e) => ListTile(
                        title: Text('- $e'),
                        subtitle: const Text('This is some description'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ...List.generate(
                              2,
                              (index) => Container(
                                height: 30,
                                width: 30,
                                margin: const EdgeInsets.only(left: 5),
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 5),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.chevron_right),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                CustomTextButton(
                  labelText: 'Add item',
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.blue,
              ),
              label: const Text(
                'Add sub-order',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
