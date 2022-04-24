import 'package:flutter/material.dart';
import 'package:simply_tailored/screens/app_resources.dart';

class PendingOrdersListView extends StatefulWidget {
  const PendingOrdersListView({Key? key}) : super(key: key);

  @override
  State<PendingOrdersListView> createState() => _PendingOrdersListViewState();
}

class _PendingOrdersListViewState extends State<PendingOrdersListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      // color: Colors.blue,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 48),
        children: [
          Container(
            // height: 100,
            width: 260,
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 10),
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
                  children: [
                    const Text(
                      'Ama Jones\nJessica Arthur',
                      maxLines: 2,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    pictureStack()
                  ],
                ),
                const Spacer(),
                const Text(
                  '- Slit and Kaba\n- Pant Suit',
                  maxLines: 2,
                ),
                const Spacer(),
                const Text('Deadline: May 20, 2022'),
                const SizedBox(
                  height: 4,
                ),
                Center(
                  child: TextButton(
                    child: const Text(
                      'View order',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget pictureStack() {
    List pictures = [
      Colors.green,
      Colors.red,
      Colors.blue,
      Colors.pink,
      Colors.yellow
    ];

    return SizedBox(
      width: (pictures.length * 30) - ((pictures.length - 1) * 15),
      height: 30,
      child: Stack(
          alignment: Alignment.center,
          children: List.generate(
              pictures.length > 4 ? 4 : pictures.length,
              (index) => Positioned(
                    right: index * 15,
                    child: Container(
                      height: pictures.length > 4 && index == 0 ? 28 : 30,
                      width: pictures.length > 4 && index == 0 ? 28 : 30,
                      decoration: BoxDecoration(
                        color: pictures.length > 4 && index == 0
                            ? Colors.grey
                            : pictures
                                .sublist(0,
                                    pictures.length > 4 ? 4 : pictures.length)
                                .reversed
                                .toList()[index], //TODO: use reverse list
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ))),
    );
  }
}
