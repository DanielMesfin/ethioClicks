import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urban_restaurant/screens/home_screen.dart';
import 'package:urban_restaurant/utils/colors.dart';
import 'package:urban_restaurant/utils/fontStyles.dart';
import 'package:urban_restaurant/widgets/reusable_button.dart';
import 'package:urban_restaurant/widgets/reusable_logo.dart';
import 'signup_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  bool? restaurantRegister = false;
  LoginScreen({Key? key, this.restaurantRegister}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void privacyDialogue() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.80,
                child: Container(),
              ),
            ),
          );
        });
  }

  void _handleLogin(BuildContext context, email, password) {
    if (email == 'example@example.com' && password == 'password') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: EdgeInsets.all(20),
          content: const Text('Incorrect email or password. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Logo(),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.only(top: 30.h),
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.w),
                child: TitleFont(
                  text: 'Well Come',
                  size: 30.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.w),
                child: Info3Font(
                  text: "Log In Here",
                  size: 18.sp,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !(RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value.toString()))) {
                      return 'Invalid email address!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    emailController.text = value.toString();
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  obscureText: _obscureText,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: _toggle,
                        icon: _obscureText
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 6) {
                      return 'Password is too short!';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    passwordController.text = value.toString();
                  },
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              RerusableButton(
                buttonLabel: "Login",
                onPressedCallback: () {
                  if (_formKey.currentState!.validate()) {
                    //    if (_formKey.currentState!.validate()) {
                    //   Provider.of<Auth>(context, listen: false).login(
                    //       context,
                    //       emailController.text,
                    //       passwordController.text,
                    //       widget.restaurantRegister);
                    _handleLogin(
                        context, emailController.text, passwordController.text);
                  }
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: const Poppins(
                      fontWeight: FontWeight.w500,
                      text: 'Forgot password',
                      color: AppColors.red,
                    ),
                  ),
                  Info2Font(
                    text: 'Do not have account?',
                    size: 10.sp,
                  ),
                  TextButton(
                    child: Poppins(
                      text: 'Sign Up',
                      color: AppColors.tertiary,
                      size: 18.sp,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
