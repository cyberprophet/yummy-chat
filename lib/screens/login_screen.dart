import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:yummy_chat/config/palette.dart';
import 'package:yummy_chat/widgets/login_form_widget.dart';
import 'package:yummy_chat/widgets/submit_btn_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        progressIndicator: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(
            Palette.googleColor,
          ),
        ),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/red.jpg',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 90,
                      left: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Welcome',
                            style: const TextStyle(
                              letterSpacing: 1,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: isSignupScreen
                                    ? ' to Yummy chat!'
                                    : ' back',
                                style: const TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Sign${isSignupScreen ? "up" : "in"} to continue',
                          style: const TextStyle(
                            letterSpacing: 1,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const AnimatedPositioned(
                duration: Duration(
                  milliseconds: 500,
                ),
                curve: Curves.easeIn,
                top: 180,
                child: LoginForm(),
              ),
              AnimatedPositioned(
                duration: const Duration(
                  milliseconds: 500,
                ),
                curve: Curves.easeIn,
                top: isSignupScreen ? 430 : 390,
                right: 0,
                left: 0,
                child: const SubmitButton(),
              ),
              AnimatedPositioned(
                duration: const Duration(
                  milliseconds: 500,
                ),
                curve: Curves.easeIn,
                top: MediaQuery.of(context).size.height -
                    (isSignupScreen ? 125 : 165),
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Text(
                      'or Sign${isSignupScreen ? "up" : "in"} with',
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        maximumSize: const Size(
                          180,
                          48,
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/btn_google_signin_light_normal.png',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void tryValidation() {
    final isValid = formKey.currentState?.validate();

    if (isValid ?? false) {
      formKey.currentState?.save();
    }
  }

  final authentication = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  String userName = '', userEmail = '', userPassword = '';
  bool isSignupScreen = false;
  bool showSpinner = false;
}
