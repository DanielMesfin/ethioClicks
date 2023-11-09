import 'package:flutter/material.dart';
import 'package:urban_restaurant/models/menu_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:urban_restaurant/models/ordered_item.dart';
import 'package:urban_restaurant/screens/search_screen.dart';
import 'package:urban_restaurant/utils/colors.dart';
import 'package:urban_restaurant/utils/fontStyles.dart';
import 'package:urban_restaurant/widgets/resturant_logo.dart';
import '../widgets/menu_card.dart';
import 'checkout_screen.dart';

class MenuScreen extends StatefulWidget {
  static const String id = 'home_page';
  const MenuScreen({Key? key}) : super(key: key);
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<Map<String, dynamic>> itemInBag = [];
  @override
  Widget build(BuildContext context) {
    int itemCountNumber = Provider.of<OrderedItemData>(context).getCount();

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const RestaurantLogo(),
              SizedBox(
                width: 15.w,
              ),
              const PrimaryText(
                text: "Ibex Restaurant",
                fontWeight: FontWeight.w800,
                color: Colors.black,
              )
            ],
          ),
          toolbarHeight: 45.h,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchScreen()));
              },
              child: Icon(
                Icons.search,
                size: 35.w,
              ),
            ),
            SizedBox(
              width: 20.h,
            )
          ],
          bottom: TabBar(
            indicatorWeight: 4,
            enableFeedback: true,
            isScrollable: true,
            tabs: [
              SecondaryText(
                text: "Breakfast",
                color: Colors.black,
                size: 18.sp,
              ),
              SecondaryText(
                text: "Lunch",
                color: Colors.black,
                size: 18.sp,
              ),
              SecondaryText(
                text: "Dinner",
                color: Colors.black,
                size: 18.sp,
              ),
              SecondaryText(
                text: "Beverages",
                color: Colors.black,
                size: 18.sp,
              ),
              SecondaryText(
                text: "Coffee",
                color: Colors.black,
                size: 18.sp,
              ),
              SecondaryText(
                text: "Bakery",
                color: Colors.black,
                size: 18.sp,
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          TabData(listItems: menuList),
          TabData(listItems: menuList5),
          TabData(listItems: menuList4),
          TabData(listItems: menuList2),
          TabData(listItems: menuList3),
          TabData(listItems: menuList6),
        ]),
        floatingActionButton: SizedBox(
          width: 60.w,
          height: 60.w,
          child: FloatingActionButton(
            backgroundColor:
                itemCountNumber > 0 ? const Color(0xffBCC536) : Colors.white70,
            onPressed: () {
              if (itemCountNumber > 0) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CheckOutScreen(
                      checkOutItem:
                          Provider.of<OrderedItemData>(context).itemInBag,
                    ),
                  ),
                );
              }
            },
            tooltip: 'Increment',
            child: Stack(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    if (itemCountNumber > 0) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CheckOutScreen(
                            checkOutItem:
                                Provider.of<OrderedItemData>(context).itemInBag,
                          ),
                        ),
                      );
                    }
                  },
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 38.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 9.w,
                    top: 13.h,
                  ),
                  child: CircleAvatar(
                    radius: 10.w,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black,
                    child: itemCountNumber > 0
                        ? Text(
                            itemCountNumber.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: Colors.red,
                            ),
                          )
                        : const Text(''),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabData extends StatelessWidget {
  final List<Map<String, dynamic>> listItems;
  const TabData({super.key, required this.listItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 10.h,
        ),
        children: [
          Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Column(
                children: listItems
                    .map((foodinfo) => MenuCard(menuData: foodinfo))
                    .toList(),
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ],
      ),
    );
  }
}
