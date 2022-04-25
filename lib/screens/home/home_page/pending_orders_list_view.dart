import 'package:flutter/material.dart';
import 'package:simply_tailored/screens/app_resources.dart';
import 'package:simply_tailored/screens/home/order_pages/order_details_screen.dart';
import 'package:simply_tailored/screens/shared/custom_buttons.dart';

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
      child: ListView.separated(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 48),
        itemCount: 5,
        itemBuilder: (context, index) => Container(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Ama Jones\nwith Jessica Arthur',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: PictureStack(
                      pictures: [
                        Colors.green,
                        Colors.red,
                        Colors.blue,
                        Colors.pink,
                        Colors.yellow
                      ],
                      pictureSize: 30,
                    ),
                  )
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
                child: CustomTextButton(
                  labelText: 'View order',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OrderDetailsScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (contex, index) => const SizedBox(width: 40),
      ),
    );
  }

  // Widget pictureStack() {
  //   List pictures = [
  //     Colors.green,
  //     Colors.red,
  //     Colors.blue,
  //     Colors.pink,
  //     Colors.yellow
  //   ];

  //   return ;
  // }
}

class PictureStack extends StatelessWidget {
  const PictureStack({
    Key? key,
    required this.pictures,
    required this.pictureSize,
  }) : super(key: key);

  final List pictures;
  final double pictureSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (pictures.length * pictureSize) -
          ((pictures.length - 1) * (pictureSize / 2)),
      height: pictureSize,
      child: Stack(
          alignment: Alignment.center,
          children: List.generate(
              pictures.length > 4 ? 4 : pictures.length,
              (index) => Positioned(
                    right: index * (pictureSize / 2),
                    child: Container(
                      height: pictures.length > 4 && index == 0
                          ? (pictureSize * .9)
                          : pictureSize,
                      width: pictures.length > 4 && index == 0
                          ? (pictureSize * .9)
                          : pictureSize,
                      decoration: BoxDecoration(
                        color: pictures.length > 4 && index == 0
                            ? Colors.grey
                            : pictures
                                .sublist(0,
                                    pictures.length > 4 ? 4 : pictures.length)
                                .reversed
                                .toList()[index],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ))),
    );
  }
}
