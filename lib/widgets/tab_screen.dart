import 'package:flutter/material.dart';
import 'package:urban_restaurant/utils/colors.dart';
import 'menu_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container TabOne(BuildContext context, int itemCountNumber,
    List<Map<String, dynamic>> listItems) {
  return Container(
    color: AppColors.white,
    child: ListView(
      children: [
        Column(
          children: [
            SizedBox(
              height: 5.h,
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
