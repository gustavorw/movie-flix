import 'package:flutter/material.dart';

class SecondayButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const SecondayButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: size.width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xff32A873),
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xff32A873),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
