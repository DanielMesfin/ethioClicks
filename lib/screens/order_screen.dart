import 'package:flutter/material.dart';
import 'package:urban_restaurant/widgets/resueable_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/oredered_item.dart';
import 'package:provider/provider.dart';
import 'package:urban_restaurant/models/ordered_item.dart';
import 'menu_screen.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/order_screen';
  final Map<String, dynamic> orderedItem;
  const OrderScreen({Key? key, required this.orderedItem}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int itemCount = 1;
  RangeValues _currentRangeValues = const RangeValues(0, 45);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        //backgroundColor: Styles.appBgColor,
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 25.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child:
                        const ReusableIcon(iconData: Icons.arrow_back_rounded),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  const Text(
                    'Order info',
                    //style: Styles.boldTextStyle,
                  ),
                  Expanded(
                    child: Container(),
                  )
                ],
              ),
            ),
            Column(
              children: [
                const Text(
                  'Order Number',
                  //style: Styles.headerTwoTextStyle,
                ),
                const Text(
                  '456',
                  style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                Text(
                  'Will be ready in ${_currentRangeValues.start} - ${_currentRangeValues.end}  Minutes',
                  // style: Styles.headerTwoTextStyle,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      // horizontal: GetSize.getScreenWidth(25),
                      // vertical: GetSize.getScreenHeight(3),
                      ),
                  child: RangeSlider(
                    values: _currentRangeValues,
                    max: 100,
                    divisions: 10,
                    //activeColor: Styles.buttonBgColor,
                    inactiveColor: Colors.grey,
                    labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                      });
                    },
                  ),
                ),
                const Text(
                  'Preparing',
                  // style: Styles.headerOneTextStyle,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order List',
                        // style: Styles.headerTwoTextStyle
                        //     .copyWith(color: Colors.white),
                      ),
                      const ReusableIcon(iconData: Icons.add_box),
                    ],
                  ),
                  OrederedItem(
                    widget: widget,
                    eachItemCount: itemCount,
                    decrement: () {
                      setState(() {
                        itemCount > 1 ? itemCount-- : itemCount;
                      });
                    },
                    increment: () {
                      setState(() {
                        itemCount++;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  // horizontal: GetSize.getScreenWidth(25),
                  // vertical: GetSize.getScreenHeight(17),
                  ),
              child: ElevatedButton(
                onPressed: () {
                  if (widget.orderedItem.containsKey('id') ==
                      widget.orderedItem.containsKey('id')) {
                    widget.orderedItem['totalPrice'] =
                        widget.orderedItem['price'] * itemCount.roundToDouble();
                    widget.orderedItem['amount'] = itemCount;
                    widget.orderedItem['timespan'] =
                        _currentRangeValues.end - _currentRangeValues.start;
                  }
                  Provider.of<OrderedItemData>(context, listen: false)
                      .addOrderedItem(widget.orderedItem);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Add To Cart',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
