import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urban_restaurant/utils/colors.dart';
import 'package:urban_restaurant/widgets/reusable_button.dart';
import 'owner_screen.dart';
import 'user_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RerusableButton(
              buttonLabel: "Owner View",
              onPressedCallback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OwnerScreen(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            RerusableButton(
              buttonLabel: "User View",
              onPressedCallback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
