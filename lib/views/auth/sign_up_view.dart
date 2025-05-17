import 'package:assessment_app/components/custom_button.dart';
import 'package:assessment_app/components/custom_text_field.dart';
import 'package:assessment_app/helpers/colors.dart';
import 'package:assessment_app/views/auth/sign_in_view.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 23),
          child: SingleChildScrollView(
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

                CustomTextField(hint: "Name"),

                CustomTextField(hint: "Email Address"),

                CustomTextField(hint: "New Password", obsecureText: true),

                CustomTextField(hint: "Confirm Password", obsecureText: true),

                SizedBox(height: 12),

                CustomButton(
                  title: "Register",
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignInView()),
                    );
                  },
                  width: MediaQuery.sizeOf(context).width * 0.9,
                ),

                TextButton(
                  onPressed: () {},
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
    );
  }
}
