import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urban_restaurant/models/ordered_item.dart';
import 'package:urban_restaurant/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urban_restaurant/utils/colors.dart';
import 'package:urban_restaurant/widgets/reusable_button.dart';

class DetailScreen extends StatefulWidget {
  final Map<String, dynamic> detailInfo;
  const DetailScreen({Key? key, required this.detailInfo}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    String selectedValue = 'Customer';
    int selectedNumber = widget.detailInfo['amount'];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //backgroundColor: Styles.appBgColor,
        body: SafeArea(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(0),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                                'images/${widget.detailInfo['image']}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: 20,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            child: Icon(
                              Icons.arrow_back,
                              size: 40,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.detailInfo['name'].toString(),
                          // style: Styles.headerOneTextStyle,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '\$${widget.detailInfo['price'].toString()}',
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.detailInfo['wight'].toString(),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Quality',
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            DropdownButton<int>(
                              underline: Container(),
                              value: selectedNumber,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedNumber = newValue ?? 0;
                                });
                              },
                              items: List.generate(20, (index) {
                                return DropdownMenuItem<int>(
                                  value: index + 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      '${index + 1}',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 65),
                        child: Center(
                          child: DropdownButtonFormField<String>(
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            value: selectedValue,
                            onChanged: (newValue) {
                              setState(() {
                                selectedValue = newValue!;
                              });
                            },
                            items: <String>[
                              'Customer',
                              'Option 2',
                              'Option 3',
                              'Option 4'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  //style: Styles.linkText,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AddingComponetes(),
                        SizedBox(
                          width: 8.w,
                        ),
                        AddingComponetes(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                    child: RerusableButton(
                      buttonLabel:
                          'Add To Order \$${widget.detailInfo['price']}',
                      onPressedCallback: () {
                        if (widget.detailInfo.containsKey('id') ==
                            widget.detailInfo.containsKey('id')) {
                          widget.detailInfo['totalPrice'] =
                              widget.detailInfo['price'] *
                                  itemCount.roundToDouble();
                          widget.detailInfo['amount'] = itemCount;
                        }
                        Provider.of<OrderedItemData>(context, listen: false)
                            .addOrderedItem(widget.detailInfo);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MenuScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddingComponetes extends StatelessWidget {
  const AddingComponetes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.h, left: 4.w, right: 4.w, bottom: 8.w),
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primary,
                  radius: 10.w,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Add Suger',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: AppColors.primary),
                    ),
                    Row(
                      children: [
                        Text(
                          '\$125',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '12.5 cal',
                          style: TextStyle(color: Colors.grey[700]),
                        )
                      ],
                    )
                  ],
                )
              ],
            )
          ]),
    );
  }
}
