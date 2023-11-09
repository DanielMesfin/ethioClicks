import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantCard extends StatelessWidget {
  final Map<String, dynamic> resturnt;
  const RestaurantCard({
    required this.resturnt,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 28.w,
          child: CircleAvatar(
            radius: 25.h,
           // backgroundImage: NetworkImage(resturnt['image']),
         backgroundImage: AssetImage('images/assets/ethioclickslogo.png'),
          ),
        ),
        title: Text(resturnt['name']),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.h,
            ),
            Text(
              resturnt['address'],
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              resturnt['phone'],
            ),
            SizedBox(
              height: 8.h,
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star_rate,
              color: Colors.orange,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(resturnt['rate'].toString())
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
