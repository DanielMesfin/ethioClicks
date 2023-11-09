import 'package:flutter/material.dart';
import 'menu_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumberController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xffD8DFDF),
      appBar: AppBar(
        backgroundColor: const Color(0xffD8DFDF),
        toolbarHeight: 80,
        title: Text(
          'We\'l text you at these number \n when your order is ready',
          //style: Styles.headerThreeTextStyle.copyWith(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 5,
          ),
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: 'Enter Your Phone Number',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Message exchange privacy ensures that only authorized individuals can access and read the messages being sent and received, safeguarding the content from unauthorized access or interception.',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 40),
                      // color: Styles.cartgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 8,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MenuScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Enable Text Update ',
                        //style: Styles.buttonTextStyle.copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
