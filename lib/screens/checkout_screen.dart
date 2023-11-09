import 'package:flutter/material.dart';
import 'package:urban_restaurant/utils/colors.dart';
import 'package:urban_restaurant/utils/fontStyles.dart';
import 'package:urban_restaurant/widgets/check_out_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:urban_restaurant/models/ordered_item.dart';
import 'package:urban_restaurant/widgets/reusable_button.dart';
import 'payment_screen.dart';

class CheckOutScreen extends StatefulWidget {
  final List<Map<String, dynamic>> checkOutItem;
  const CheckOutScreen({Key? key, required this.checkOutItem})
      : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    int itemCountNumber = Provider.of<OrderedItemData>(context).getCount();

    return Scaffold(
      appBar: AppBar(
        title: PrimaryText(
          text: '${itemCountNumber.toString()} Item In Your Cart',
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
        backgroundColor: AppColors.white,
      ),
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 3.h,
              ),
              Column(
                children: widget.checkOutItem
                    .map(
                      (eachItem) => CheckOutItemOrdered(
                        menuData: eachItem,
                      ),
                    )
                    .toList(),
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
          Positioned(
            left: 8.w,
            right: 8.w,
            bottom: 10.h,
            child: RerusableButton(
              buttonLabel:
                  "CheckOut \$${Provider.of<OrderedItemData>(context).totalCostInCart().toStringAsFixed(2)}",
              onPressedCallback: () {
                Provider.of<OrderedItemData>(context, listen: false)
                    .checkOutAll();
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentScreen(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
