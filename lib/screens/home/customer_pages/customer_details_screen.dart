import 'package:flutter/material.dart';
import 'package:simply_tailored/screens/app_resources.dart';
import 'package:simply_tailored/screens/home/home_page/pending_orders_list_view.dart';
import 'package:simply_tailored/screens/shared/custom_buttons.dart';
import 'package:simply_tailored/screens/shared/custom_textformfield.dart';

class CustomerDetailsScreen extends StatefulWidget {
  const CustomerDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CustomerDetailsScreen> createState() => _CustomerDetailsScreenState();
}

class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneTextField = TextEditingController();

  ValueNotifier<Gender?> genderValueNotifier = ValueNotifier<Gender?>(null);

  TextEditingController acrossBackController = TextEditingController();
  TextEditingController acrossChestController = TextEditingController();
  TextEditingController ankleController = TextEditingController();
  TextEditingController aroundArmController = TextEditingController();
  TextEditingController blouseLengthController = TextEditingController();
  TextEditingController bustController = TextEditingController();
  TextEditingController chestController = TextEditingController();
  TextEditingController crotchLengthController = TextEditingController();
  TextEditingController dressLengthController = TextEditingController();
  TextEditingController highHipController = TextEditingController();
  TextEditingController hipController = TextEditingController();
  TextEditingController kneeController = TextEditingController();
  TextEditingController neckController = TextEditingController();
  TextEditingController nippleToNippleController = TextEditingController();
  TextEditingController shirtLengthController = TextEditingController();
  TextEditingController shoulderToNippleController = TextEditingController();
  TextEditingController shoulderToWaistController = TextEditingController();
  TextEditingController shoulderWidthController = TextEditingController();
  TextEditingController skirtLengthController = TextEditingController();
  TextEditingController sleeveLengthController = TextEditingController();
  TextEditingController slitLengthController = TextEditingController();
  TextEditingController thighControllerController = TextEditingController();
  TextEditingController trouserLengthController = TextEditingController();
  TextEditingController underbustController = TextEditingController();
  TextEditingController waistController = TextEditingController();
  TextEditingController wristController = TextEditingController();

  TextEditingController additionalInfoController = TextEditingController();

  List<List<dynamic>> maleMeasurementList() => [
        ['Chest', chestController],
        ['Neck', neckController],
        ['Across back', acrossBackController],
        ['Shirt length', acrossChestController],
        ['Shoulder width', shoulderWidthController],
        ['Sleeve length', sleeveLengthController],
        ['Around arm', aroundArmController],
        ['Wrist', wristController],
        ['Waist', waistController],
        ['Hip', hipController],
        ['Thigh', thighControllerController],
        ['Knee', kneeController],
        ['Ankle', ankleController],
        ['Crotch length', crotchLengthController],
        ['Trouser length', trouserLengthController],
      ];

  List<List<dynamic>> femaleMeasurementList() => [
        ['Bust', bustController],
        ['Waist', waistController],
        ['Hip', hipController],
        ['High hip', highHipController],
        ['Neck', neckController],
        ['Shoulder to nipple', shoulderToNippleController],
        ['Nipple to nipple', nippleToNippleController],
        ['Across chest', acrossChestController],
        ['Across back', acrossBackController],
        ['Shoulder to waist', shoulderToWaistController],
        ['Underbust', underbustController],
        ['Sleeve length', sleeveLengthController],
        ['Around arm', aroundArmController],
        ['Wrist', wristController],
        ['Dress Length', dressLengthController],
        ['Skirt Length', skirtLengthController],
        ['Slit length', slitLengthController],
        ['Blouse length', blouseLengthController],
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Edit Customer',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.phone,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: SizedBox(
          width: kScreenWidth(context),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Personal info',
                            style: TextStyle(fontSize: 18))),
                    const SizedBox(height: 10),
                    const PrefixTextFormField(
                      hintText: 'Name',
                      iconData: Icons.person,
                      textCapitalization: TextCapitalization.words,
                    ),
                    const SizedBox(height: 10),
                    const PrefixTextFormField(
                      hintText: 'Phone',
                      iconData: Icons.phone,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 10),
                    const PrefixTextFormField(
                        hintText: 'Address', iconData: Icons.location_on),
                    const SizedBox(height: 30),
                    ValueListenableBuilder<Gender?>(
                      valueListenable: genderValueNotifier,
                      builder: (context, value, child) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Measurments',
                                  style: TextStyle(fontSize: 18),
                                ),
                                const Spacer(),
                                DropdownButton<Gender>(
                                  hint: const Text('Gender'),
                                  value: genderValueNotifier.value,
                                  items: const <DropdownMenuItem<Gender>>[
                                    DropdownMenuItem(
                                      child: Text('Male'),
                                      value: Gender.male,
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Female'),
                                      value: Gender.female,
                                    ),
                                  ],
                                  onChanged: (value) {
                                    genderValueNotifier.value = value;
                                  },
                                ),
                              ],
                            ),
                            value == null
                                ? const SizedBox()
                                : GridView.count(
                                    primary: false,
                                    crossAxisCount: 2,
                                    shrinkWrap: true,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 4,
                                    padding: const EdgeInsets.only(top: 2),
                                    children: whichMeasurementForm()
                                        .map(
                                          (e) => CustomTextFormField(
                                            hintText: e[0],
                                            controller: e[1],
                                            keyboardType: TextInputType.number,
                                          ),
                                        )
                                        .toList(),
                                  ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    CustomElevatedButton(
                      labelText: 'Save customer',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        const Text(
                          'Orders',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const Spacer(),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add, color: Colors.blue),
                          label: const Text('Add new',
                              style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 260,
                      clipBehavior: Clip.none,
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
                                'with Jessica Arthur',
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
                    );
                  },
                  separatorBuilder: (contex, index) =>
                      const SizedBox(width: 40),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List whichMeasurementForm() {
    List measurementList = [];

    if (genderValueNotifier.value == Gender.female) {
      measurementList = femaleMeasurementList();
    } else if (genderValueNotifier.value == Gender.male) {
      measurementList = maleMeasurementList();
    }
    measurementList
        .sort((a, b) => a[0].toLowerCase().compareTo(b[0].toLowerCase()));
    return measurementList;
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneTextField.dispose();
    addressController.dispose();

    genderValueNotifier.dispose();

    acrossBackController.dispose();
    acrossChestController.dispose();
    ankleController.dispose();
    aroundArmController.dispose();
    blouseLengthController.dispose();
    bustController.dispose();
    chestController.dispose();
    crotchLengthController.dispose();
    dressLengthController.dispose();
    highHipController.dispose();
    hipController.dispose();
    kneeController.dispose();
    neckController.dispose();
    nippleToNippleController.dispose();
    shirtLengthController.dispose();
    shoulderToNippleController.dispose();
    shoulderToWaistController.dispose();
    shoulderWidthController.dispose();
    skirtLengthController.dispose();
    sleeveLengthController.dispose();
    slitLengthController.dispose();
    thighControllerController.dispose();
    trouserLengthController.dispose();
    underbustController.dispose();
    waistController.dispose();
    wristController.dispose();

    additionalInfoController.dispose();

    super.dispose();
  }
}

enum Gender { male, female }
