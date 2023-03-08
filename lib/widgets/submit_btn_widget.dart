import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yummy_chat/screens/chat_screen.dart';
import 'package:yummy_chat/screens/login_screen.dart';

class SubmitButton extends StatefulWidget {
  const SubmitButton({super.key});

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(
          15,
        ),
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: GestureDetector(
          onTap: () async {
            final ls = context.findAncestorStateOfType<LoginScreenState>()!;
            ls.setState(() => ls.showSpinner = true);
            ls.tryValidation();

            try {
              final bytes = utf8.encode(ls.userPassword);
              final digest = sha512.convert(bytes);
              UserCredential sub;

              if (ls.isSignupScreen) {
                sub = await ls.authentication.createUserWithEmailAndPassword(
                  email: ls.userEmail,
                  password: digest.toString(),
                );
              } else {
                sub = await ls.authentication.signInWithEmailAndPassword(
                  email: ls.userEmail,
                  password: digest.toString(),
                );
              }
              if (context.mounted) {
                return;
              }
              if (sub.user != null) {
                Navigator.push(
                  ls.context,
                  MaterialPageRoute(
                    builder: (_) => const ChatScreen(),
                  ),
                );
              }
            } catch (e) {
              ScaffoldMessenger.of(ls.context).showSnackBar(
                SnackBar(
                  content: Text('${(e as FirebaseAuthException).message}'),
                  backgroundColor: Colors.blue,
                ),
              );
            }
            ls.setState(() => ls.showSpinner = false);
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Colors.orange,
                  Colors.red,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(
                    0,
                    1,
                  ),
                ),
              ],
            ),
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
