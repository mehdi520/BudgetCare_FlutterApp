import 'package:flutter/material.dart';

import '../../../core/core_exports.dart';

class DatePickerTextFormField extends StatelessWidget {
  final String hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextInputAction? imeAction;
  final TextInputType? keyboardType;
  final bool? isSecureTextField;
  final String? Function(String?)? validator;
  final TextEditingController ctrl;
  final VoidCallback ontap;

  const DatePickerTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.imeAction,
    this.keyboardType,
    this.isSecureTextField,
    this.validator,
    required this.ctrl,
    required this.ontap
  });


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctrl,
      onTap: ontap,
      keyboardType: keyboardType != null ? keyboardType:  TextInputType.text,
      textInputAction: imeAction != null ? imeAction : TextInputAction.done,
      obscureText: isSecureTextField != null ? isSecureTextField! : false,
      readOnly: true,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,

        filled: false,
        border:  UnderlineInputBorder(
            borderSide:BorderSide(color:AppColors.primary,width: 2)
        ),
        enabledBorder:  UnderlineInputBorder(
            borderSide:BorderSide(color:AppColors.primary,width: 2)

        ),
        focusedBorder:  UnderlineInputBorder(
            borderSide:BorderSide(color:AppColors.primary,width: 2)

        ),
      ),
    );
  }
}
