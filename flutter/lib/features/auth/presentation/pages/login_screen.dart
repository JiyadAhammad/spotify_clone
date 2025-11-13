import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/color/colors.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/text_widget.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/rich_text_widget.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static CupertinoPageRoute<LoginScreen> pageRoute() =>
      CupertinoPageRoute<LoginScreen>(
        builder: (BuildContext context) => const LoginScreen(),
      );

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _passwordObscure = true;

  void _onTapSignup() {
    /// Navigate to Signup page
    Navigator.of(context).pushReplacement(SignupScreen.pageRoute());
  }

  void _onTapLogin() {
    if (_formKey.currentState!.validate()) {
      /// Form Validation success
    }
  }

  void _passwordObscureState() {
    /// Update Password visibility
    setState(() {
      _passwordObscure = !_passwordObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const TextWidget(
                'Login',
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
              AuthTextField(
                controller: _emailController,
                hintText: 'Enter your email',
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter your email';
                  }
                  final RegExp emailRegex = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );

                  if (emailRegex.hasMatch(val)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              AuthTextField(
                controller: _passwordController,
                hintText: 'Enter your password',
                obscureText: _passwordObscure,
                suffixIcon: _passwordObscure
                    ? Icons.visibility
                    : Icons.visibility_off,
                onSuffixTap: _passwordObscureState,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (val.length < 6) {
                    return 'Password should be at least 6 character';
                  }
                  return null;
                },
              ),
              PrimaryButton(
                buttonActive: true,
                onTap: _onTapLogin,
                buttonText: 'Login',
              ),

              RichTextWidget(
                text: "Don't have an account? ",
                children: <InlineSpan>[
                  TextSpan(
                    text: 'Signup',
                    style: const TextStyle(
                      color: AppColor.primaryButtonColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = _onTapSignup,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
