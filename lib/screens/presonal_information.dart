import 'package:flutter/material.dart';
import 'package:urban_restaurant/widgets/resueable_icon.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Styles.appBgColor,
        body: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Your Personal Information ",
                    //style: Styles.headerTwoTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  InkWell(
                      onTap: () {
                        // Navigator.of(context).pushAndRemoveUntil(
                        // the new route
                        //   MaterialPageRoute(
                        //     builder: (BuildContext context) =>
                        //         const LoginScreen(),
                        //   ),

                        //   (Route route) => false,
                        // );
                      },
                      child: const ReusableIcon(iconData: Icons.logout_rounded))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
