import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urban_restaurant/utils/colors.dart';
import 'package:urban_restaurant/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urban_restaurant/models/ordered_item.dart';
//import 'package:breakfast/screens/paymentScreen.dart';

class CheckOutItemOrdered extends StatefulWidget {
  final Map<String, dynamic> menuData;
  const CheckOutItemOrdered({super.key, required this.menuData});

  @override
  State<CheckOutItemOrdered> createState() => _CheckOutItemOrderedState();
}

class _CheckOutItemOrderedState extends State<CheckOutItemOrdered> {
  @override
  Widget build(BuildContext context) {
    int? selectedNumber = widget.menuData['amount'];
    return Container(
      color: AppColors.white,
      height: 100.h,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.w),
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage('images/${widget.menuData['image']}'),
                  radius: 33,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.menuData['name'],
                    //style: Styles.headerThreeTextStyle,
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    '\$${widget.menuData['totalPrice'].toStringAsFixed(2)}',
                    //style: Styles.headerFourTextStyle,
                  ),
                ],
              ),
              Expanded(child: Container()),
              Container(
                height: 27,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: DropdownButton<int>(
                  underline: Container(),
                  value: selectedNumber,
                  onChanged: (newValue) {
                    setState(() {
                      selectedNumber = newValue;
                    });
                  },
                  items: List.generate(20, (index) {
                    return DropdownMenuItem<int>(
                      value: index + 1,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          '${index + 1}',
                          style:
                              const TextStyle(decoration: TextDecoration.none),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<OrderedItemData>(context, listen: false)
                      .removeItem(widget.menuData['id']);
                },
                child: const Icon(
                  Icons.cancel,
                  size: 37,
                  fill: 0.5,
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const DividerLine()
        ],
      ),
    );
  }
}
