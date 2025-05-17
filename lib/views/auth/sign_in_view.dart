import 'package:assessment_app/components/custom_button.dart';
import 'package:assessment_app/components/custom_text_field.dart';
import 'package:assessment_app/helpers/colors.dart';
import 'package:assessment_app/views/auth/sign_up_view.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 23),
          child: SingleChildScrollView(
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

                CustomTextField(hint: "Email Address"),

                CustomTextField(hint: "Password", obsecureText: true),

                SizedBox(height: 12),

                CustomButton(
                  title: "Login",
                  onPressed: () {},
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
    );
  }
}
