import 'package:flutter/material.dart';

class AmmenitiesList extends StatelessWidget {
  const AmmenitiesList({super.key, required this.value, required this.text});
  final bool value;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: value
              ? Colors.greenAccent.withOpacity(0.2)
              : Colors.grey.withOpacity(0.3),
          border: value ? Border.all(color: Colors.green) : null,
        ),
        height: 40,
        width: 100,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: value ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
