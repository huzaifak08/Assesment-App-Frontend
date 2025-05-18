import 'package:assessment_app/components/custom_button.dart';
import 'package:assessment_app/components/custom_text_field.dart';
import 'package:assessment_app/helpers/colors.dart';
import 'package:assessment_app/providers/app_provider_container.dart';
import 'package:assessment_app/providers/auth_provider/auth_provider.dart';
import 'package:assessment_app/views/auth/sign_in_view.dart';
import 'package:assessment_app/views/home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _showPassword = false;

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 23),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    child: Image.asset("assets/images/splash.png"),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Register to start",
                    style: TextStyle(
                      fontSize: 26,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),

                  CustomTextField(
                    hint: "Name",
                    controller: _nameController,
                    onValidator: (value) {
                      if (value!.isEmpty) {
                        return "Name is required";
                      }

                      return null;
                    },
                  ),

                  CustomTextField(
                    hint: "Email Address",
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    onValidator: (value) {
                      if (value!.isEmpty) {
                        return "Email is required";
                      } else if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(value)) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                  ),

                  CustomTextField(
                    hint: "New Password",
                    obsecureText: !_showPassword,
                    controller: _passwordController,
                    onValidator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      } else if (value.length < 8) {
                        return "Password must be at least 8 characters";
                      } else if (!RegExp(
                        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$",
                      ).hasMatch(value)) {
                        return "Password must have upper, lower, and number";
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      icon:
                          _showPassword
                              ? Icon(
                                Icons.visibility,
                                color: AppColors.primaryColor,
                              )
                              : Icon(Icons.visibility_off),
                    ),
                  ),

                  CustomTextField(
                    hint: "Confirm Password",
                    obsecureText: true,
                    controller: _confirmPasswordController,
                    onValidator: (value) {
                      if (value != _passwordController.text) {
                        return "Password doesn't match";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 12),

                  _isLoading
                      ? Center(
                        child: SizedBox(
                          height: 50,
                          child: CupertinoActivityIndicator(),
                        ),
                      )
                      : CustomButton(
                        title: "Register",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _isLoading = true;
                            });

                            final result = await AppProviderContainer.instance
                                .read(
                                  registerUserNotifierProvider(
                                    _nameController.text,
                                    _emailController.text,
                                    _passwordController.text,
                                  ).future,
                                );

                            if (result['status'] == false) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(result['message']),
                                  backgroundColor: AppColors.alertColor,
                                ),
                              );
                            } else {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => HomeView(),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            }

                            setState(() {
                              _isLoading = false;
                            });
                          }
                        },
                        width: MediaQuery.sizeOf(context).width * 0.9,
                      ),

                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignInView()),
                      );
                    },
                    child: Text(
                      "Login instead",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColor,
                      ),
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
