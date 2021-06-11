import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final clickOnLogin;

  // ignore: sort_constructors_first
  const CustomButton(this.clickOnLogin);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        clickOnLogin(context);
      },
      child: Container(
        margin: const EdgeInsets.all(8),

        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(36),
        ),
        alignment: Alignment.center,

        child: const Text(
          'Login',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xffF99D90), fontSize: 23.0),
        ),
      ),
    );
  }
}
