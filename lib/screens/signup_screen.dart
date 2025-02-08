import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(6.0),
              child: TextFormField(
                validator: ,
              ),
            )
          ],
        ),
      ),
    );
  }
}
