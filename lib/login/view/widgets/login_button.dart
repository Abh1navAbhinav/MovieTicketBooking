import 'package:flutter/material.dart';
import 'package:ticket_booking/main.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Material(
        elevation: 5,
        shadowColor: Colors.white,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kColor2,
          ),
          height: 50,
          width: 100,
          child: Center(
            child: Text(
              'Login',
              style: kButtonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
