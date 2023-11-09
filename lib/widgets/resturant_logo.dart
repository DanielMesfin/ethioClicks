import 'package:flutter/material.dart';
import 'package:urban_restaurant/utils/colors.dart';

class RestaurantLogo extends StatelessWidget {
  const RestaurantLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: AppColors.primary,
      radius: 20,
      child: CircleAvatar(
        radius: 18,
        backgroundColor: AppColors.transparent,
        backgroundImage: AssetImage('images/assets/ethioclickslogo.png'),
      ),
    );
  }
}
