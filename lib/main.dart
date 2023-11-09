import 'package:urban_restaurant/models/ordered_item.dart';
import 'package:urban_restaurant/screens/menu_screen.dart';
import 'package:urban_restaurant/screens/home_screen.dart';
import 'package:urban_restaurant/screens/login_screen.dart';
import 'package:urban_restaurant/screens/splash_screen.dart';
import 'package:urban_restaurant/screens/user_screen.dart';
import 'package:urban_restaurant/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return ChangeNotifierProvider<OrderedItemData>(
          create: (context) => OrderedItemData(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Restaurant',
            theme: ThemeData(
              primaryColor: AppColors.primary,
              primarySwatch: Colors.orange,
            ),
            home: const SplashScreen(),
            routes: {
              LoginScreen.routeName: (ctx) => LoginScreen(),
              HomeScreen.routeName: (ctx) => const HomeScreen(),
              SplashScreen.routeName: (ctx) => const SplashScreen(),
              MenuScreen.id: (ctx) => const MenuScreen(),
              UserScreen.routeName: (cxt) => const UserScreen()
            },
          ),
        );
      },
    );
  }
}
