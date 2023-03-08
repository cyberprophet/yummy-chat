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
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
          bottom: 20,
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
                  key: ls.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        key: const ValueKey(1),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'Please enter at least 4 characters';
                          }
                          return null;
                        },
                        onSaved: (newValue) => ls.userName = newValue ?? '',
                        onChanged: (value) => ls.userName = value,
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
                        keyboardType: TextInputType.emailAddress,
                        key: const ValueKey(2),
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email at address.';
                          }
                          return null;
                        },
                        onSaved: (newValue) => ls.userEmail = newValue ?? '',
                        onChanged: (value) => ls.userEmail = value,
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
                        obscureText: true,
                        key: const ValueKey(3),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 6) {
                            return 'Password must be at least 7 characters long.';
                          }
                          return null;
                        },
                        onSaved: (newValue) => ls.userPassword = newValue ?? '',
                        onChanged: (value) => ls.userPassword = value,
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
                  key: ls.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        key: const ValueKey(4),
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email at address.';
                          }
                          return null;
                        },
                        onSaved: (newValue) => ls.userEmail = newValue ?? '',
                        onChanged: (value) => ls.userEmail = value,
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
                        obscureText: true,
                        key: const ValueKey(5),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 6) {
                            return 'Password must be at least 7 characters long.';
                          }
                          return null;
                        },
                        onSaved: (newValue) => ls.userPassword = newValue ?? '',
                        onChanged: (value) => ls.userPassword = value,
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
      ),
    );
  }
}
