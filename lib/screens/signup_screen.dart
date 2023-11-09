import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urban_restaurant/screens/login_screen.dart';
import 'package:urban_restaurant/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:urban_restaurant/utils/fontStyles.dart';
import 'package:urban_restaurant/widgets/reusable_button.dart';
import 'package:urban_restaurant/widgets/reusable_logo.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static const routeName = '/signup';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool _obscureText = true;
  String backendUrl = '';
  // String backendUrl = 'https://esoora-backend-prod-qiymu.ondigitalocean.app';

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Expanded(child: Container()),
            const Logo(),
            SizedBox(
              width: 15.w,
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Info3Font(
                    text: "Register Here",
                    size: 18,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    maxLength: 20,
                    textCapitalization: TextCapitalization.sentences,
                    controller: fNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      // suffixIcon: Icon(Icons.person),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'First Name',
                    ),
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return 'First name is required';
                      }

                      if (!(RegExp(r"^[a-zA-Z ]*$").hasMatch(val.toString()))) {
                        return 'Invalid Name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      fNameController.text = value.toString();
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    maxLength: 20,
                    textCapitalization: TextCapitalization.sentences,
                    controller: lNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      // suffixIcon: Icon(Icons.person),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'Last Name',
                    ),
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return 'Last name is required';
                      }
                      if (!(RegExp(r"^[a-zA-Z ]*$").hasMatch(val.toString()))) {
                        return 'Invalid Name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      lNameController.text = value.toString();
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
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
                  height: 8.h,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'Phone',
                      // prefixIcon: Icon(Icons.phone_android, size: 20)
                    ),
                    keyboardType: TextInputType.number,
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return 'Phone number is required';
                      }
                      if (!RegExp(r"^(?:[+0]9)?[0-9]{10}$")
                          .hasMatch(val.toString())) {
                        return 'invalid phone number';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      phoneController.text = val.toString();
                    },
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    maxLength: 30,
                    textCapitalization: TextCapitalization.sentences,
                    controller: streetController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'Street',
                      // prefixIcon: Icon(Icons.add_road_rounded, size: 20),
                    ),
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return 'Street is required';
                      }
                      if (!(RegExp(r"^[a-zA-Z 0-9]*$")
                          .hasMatch(val.toString()))) {
                        return 'Invalid Street';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      streetController.text = value.toString();
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    maxLength: 20,
                    textCapitalization: TextCapitalization.sentences,
                    controller: cityController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'City',
                      // prefixIcon: Icon(Icons.location_city, size: 20),
                    ),
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return 'City is required';
                      }
                      if (!(RegExp(r"^[a-zA-Z 0-9]*$")
                          .hasMatch(val.toString()))) {
                        return 'Invalid City';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      cityController.text = value.toString();
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    obscureText: _obscureText,
                    // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: _toggle,
                          icon: _obscureText
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                      // suffixIcon: Icon(Icons.lock),
                      enabledBorder: const OutlineInputBorder(
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
                  height: 8.h,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    obscureText: _obscureText,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      // suffixIcon: Icon(Icons.lock),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'Confirm Password',
                    ),
                    validator: (value) {
                      if (value != passwordController.text) {
                        return 'Passwords do not match!';
                      } else if (value!.isEmpty) {
                        return 'Confirm Password can\'t be empty!';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                RerusableButton(
                  buttonLabel: "Sign Up",
                  onPressedCallback: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Info2Font(text: 'Already have an account?'),
                    TextButton(
                      child: const Poppins(
                        text: 'Login',
                        color: AppColors.tertiary,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
