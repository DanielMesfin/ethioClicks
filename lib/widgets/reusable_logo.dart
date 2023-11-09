import 'package:flutter/material.dart';
import 'package:urban_restaurant/utils/colors.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: AppColors.primary,
      radius: 22,
      child: CircleAvatar(
        backgroundColor: AppColors.transparent,
        backgroundImage: AssetImage('images/assets/ethioclickslogo.png'),
      ),
    );
  }
}
