import 'package:flutter/material.dart';
import 'package:yummy_chat/config/palette.dart';
import 'package:yummy_chat/screens/login_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final ls = context.findAncestorStateOfType<LoginScreenState>()!;

    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 500,
      ),
      curve: Curves.easeIn,
      padding: const EdgeInsets.all(
        20,
      ),
      height: ls.isSignupScreen ? 280 : 250,
      width: MediaQuery.of(context).size.width - 40,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          15,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() => ls.isSignupScreen = false);
                  ls.setState(() => ls.isSignupScreen = false);
                },
                child: Column(
                  children: [
                    Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ls.isSignupScreen
                            ? Palette.textColor1
                            : Palette.activeColor,
                      ),
                    ),
                    if (!ls.isSignupScreen)
                      Container(
                        margin: const EdgeInsets.only(
                          top: 3,
                        ),
                        height: 2,
                        width: 55,
                        color: Colors.orange,
                      ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() => ls.isSignupScreen = true);
                  ls.setState(() => ls.isSignupScreen = true);
                },
                child: Column(
                  children: [
                    Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ls.isSignupScreen
                            ? Palette.activeColor
                            : Palette.textColor1,
                      ),
                    ),
                    if (ls.isSignupScreen)
                      Container(
                        margin: const EdgeInsets.only(
                          top: 3,
                        ),
                        height: 2,
                        width: 75,
                        color: Colors.orange,
                      ),
                  ],
                ),
              )
            ],
          ),
          if (ls.isSignupScreen)
            Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Palette.iconColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Palette.textColor1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(35),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Palette.textColor1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(35),
                          ),
                        ),
                        hintText: 'name',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Palette.textColor1,
                        ),
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Palette.iconColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Palette.textColor1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(35),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Palette.textColor1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(35),
                          ),
                        ),
                        hintText: 'email',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Palette.textColor1,
                        ),
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Palette.iconColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Palette.textColor1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(35),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Palette.textColor1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(35),
                          ),
                        ),
                        hintText: 'password',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Palette.textColor1,
                        ),
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (!ls.isSignupScreen)
            Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Palette.iconColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Palette.textColor1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(35),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Palette.textColor1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(35),
                          ),
                        ),
                        hintText: 'email',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Palette.textColor1,
                        ),
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Palette.iconColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Palette.textColor1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(35),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Palette.textColor1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(35),
                          ),
                        ),
                        hintText: 'password',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Palette.textColor1,
                        ),
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
