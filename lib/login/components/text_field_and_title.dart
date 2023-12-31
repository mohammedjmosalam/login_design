import 'package:flutter/material.dart';

class TextFieldAndTitle extends StatelessWidget {
  const TextFieldAndTitle({
    super.key,
    required this.title,
    required this.hitText,
    this.isShowPassword,
    this.suffixIcon,
    required this.validator,
    this.helperText,
  });
  final String title;
  final String hitText;
  final bool? isShowPassword;
  final Widget? suffixIcon;
  final String? Function(String? value) validator;
  final String? helperText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 27,
          ),
        ),
        TextFormField(
          validator: validator,
          obscureText: isShowPassword ?? false,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hitText,
            helperText: helperText,
            helperMaxLines: 2,
            errorMaxLines: 2,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.green.shade900,
              ),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
          ),
        )
      ],
    );
  }
}
