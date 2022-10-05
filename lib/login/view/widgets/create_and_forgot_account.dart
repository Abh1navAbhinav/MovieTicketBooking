import 'package:flutter/material.dart';
import 'package:ticket_booking/main.dart';

class CreateAndForgotAccount extends StatelessWidget {
  const CreateAndForgotAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Create new Account',
            style: ktextStyle,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Forgot password?',
            style: ktextStyle,
          ),
        ),
      ],
    );
  }
}
