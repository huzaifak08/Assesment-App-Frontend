import 'package:assessment_app/components/custom_button.dart';
import 'package:assessment_app/components/custom_text_field.dart';
import 'package:assessment_app/helpers/colors.dart';
import 'package:assessment_app/providers/app_provider_container.dart';
import 'package:assessment_app/providers/auth_provider/auth_provider.dart';
import 'package:assessment_app/views/auth/sign_up_view.dart';
import 'package:assessment_app/views/home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                  Image.asset("assets/images/splash.png"),
                  SizedBox(height: 12),
                  Text(
                    "Login to start",
                    style: TextStyle(
                      fontSize: 26,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),

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
                    controller: _passwordController,
                    hint: "Password",
                    obsecureText: true,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.visibility_off),
                    ),
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
                        title: "Login",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _isLoading = true;
                            });

                            final result = await AppProviderContainer.instance
                                .read(
                                  loginUserNotifierProvider(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpView()),
                      );
                    },
                    child: Text(
                      "Create new account",
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
