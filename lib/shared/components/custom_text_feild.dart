import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.hint,
    required this.controller,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  final String hint;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final IconData prefixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: TextStyle(color: Theme.of(context).textTheme.labelLarge?.color),
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontFamily: 'Poppins',
                fontSize: 16,
              ),

          // TextStyle(fontFamily: 'Poppins'),
          prefixIcon: Icon(
            prefixIcon,
            color: Theme.of(context).textTheme.labelLarge?.color,
          ),
          enabledBorder: border(),
          focusedBorder: border(borderColor: Theme.of(context).focusColor
              //  borderColor: Colors.black
              )),
    );
  }

  OutlineInputBorder border({Color borderColor = Colors.grey}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
