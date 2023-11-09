import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urban_restaurant/utils/colors.dart';
import 'package:urban_restaurant/utils/fontStyles.dart';

class RerusableButton extends StatelessWidget {
  final String buttonLabel;
  final Function()? onPressedCallback;
  const RerusableButton({
    required this.buttonLabel,
    required this.onPressedCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
        onPressed: onPressedCallback,
        child: InfoFont(
          text: buttonLabel,
          size: 24.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.white,
        ),
      ),
    );
  }
}
