import 'package:expense_tracker/core/constants/constants.dart';
import 'package:expense_tracker/core/navigation/fade_page_route.dart';
import 'package:expense_tracker/features/authentication/screens/sign_up_screen.dart';
import 'package:expense_tracker/features/authentication/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  "Welcome back! Glad\nto see you, Again!",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    color: Color(0xff1E232C),
                  ),
                ),
                SizedBox(height: 32),
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
                      hintText: "Enter your password",
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
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff6A707C),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 80),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {},

                    child: Text(
                      "Login",
                    ),
                  ),
                ),

                SizedBox(height: 48),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Or Login with",
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
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
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
                          MyCustomRouteTransition(route: SignUpScreen()),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2,
                          vertical: 10,
                        ),
                        child: Text(
                          'Register Now',
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
