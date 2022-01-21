import 'package:addlisting/custom-widgets.dart/form-design.dart';
import 'package:addlisting/services.dart/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../custom-widgets.dart/form-design.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Auth _auth = Get.put(Auth());

  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _mobileCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();
  TextEditingController _confirmpasswordCtrl = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Image.asset(
                              "lib/assets/images/background.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 200,
                            child: Image.asset(
                              "lib/assets/images/logo.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: _nameCtrl,
                      keyboardType: TextInputType.text,
                      decoration:
                          buildInputDecoration(Icons.person, "Full Name"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: _emailCtrl,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.email, "Email"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please a Enter';
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return 'Please a valid Email';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: _mobileCtrl,
                      keyboardType: TextInputType.number,
                      decoration: buildInputDecoration(Icons.phone, "Phone No"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter phone no ';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: _passwordCtrl,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.lock, "Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please a Enter Password';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: _confirmpasswordCtrl,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration:
                          buildInputDecoration(Icons.lock, "Confirm Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please re-enter password';
                        }
                        print(_passwordCtrl.text);
                        print(_confirmpasswordCtrl.text);

                        if (_passwordCtrl.text != _confirmpasswordCtrl.text) {
                          return "Password does not match";
                        }

                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _auth.register(
                            _nameCtrl.text,
                            _emailCtrl.text,
                            _mobileCtrl.text,
                            _passwordCtrl.text,
                          );
                          print("successful");

                          return;
                        } else {
                          print("UnSuccessfull");
                        }
                      },
                      child: Text("Submit"),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: TextButton(
                      child: Text("Already have an account?"),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
