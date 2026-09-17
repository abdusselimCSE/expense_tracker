import 'package:expense_tracker/core/constants/constants.dart';
import 'package:expense_tracker/core/navigation/fade_page_route.dart';
import 'package:expense_tracker/features/authentication/screens/login_screen.dart';
import 'package:expense_tracker/features/authentication/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),

                SvgPicture.asset(
                  AppConstants().splashLogo,
                ),
                SizedBox(height: 32),
                Text(
                  "Nice to meet you!",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: Color(0xff1E232C),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Before we begin, we need some details.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff1E232C),
                  ),
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 61.53,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Username",
                    ),
                  ),
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 61.53,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                    ),
                  ),
                ),

                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 61.53,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.visibility,
                          color: Color(0xff6A707C),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 61.53,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Confirm password",
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.visibility,
                          color: Color(0xff6A707C),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {},

                    child: Text(
                      "Register",
                    ),
                  ),
                ),

                SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Or Register with",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff6A707C),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SocialLoginButton(
                        iconPath: AppConstants().facebookIcon,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: SocialLoginButton(
                        iconPath: AppConstants().googleIcon,
                      ),
                    ),
                    SizedBox(width: 12),

                    Expanded(
                      child: SocialLoginButton(
                        iconPath: AppConstants().appleIcon,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: Color(0xFF1E232C),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MyCustomRouteTransition(route: LoginScreen()),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2,
                          vertical: 10,
                        ),
                        child: Text(
                          'Login Now',
                          style: TextStyle(
                            color: Color(0xFF4F378A),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
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
