import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/color/colors.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/text_widget.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/rich_text_widget.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static CupertinoPageRoute<SignupScreen> pageRoute() =>
      CupertinoPageRoute<SignupScreen>(
        builder: (BuildContext context) => const SignupScreen(),
      );

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _passwordObscure = true;

  void _onTapLogin() {
    /// Navigate to login page
    Navigator.pushReplacement(context, LoginScreen.pageRoute());
  }

  void _onTapSignup() {
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
                'Signup',
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
              AuthTextField(
                controller: _nameController,
                hintText: 'Enter your name',
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter your name';
                  }
                  if (val.length < 4) {
                    return 'Please enter a valid name';
                  }
                  return null;
                },
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
                    return 'Please enter a Strong password';
                  }
                  return null;
                },
              ),
              PrimaryButton(
                buttonActive: true,
                onTap: _onTapSignup,
                buttonText: 'Sign up',
              ),

              RichTextWidget(
                text: 'Already have an account? ',
                children: <InlineSpan>[
                  TextSpan(
                    text: 'Login',
                    style: const TextStyle(
                      color: AppColor.primaryButtonColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = _onTapLogin,
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
