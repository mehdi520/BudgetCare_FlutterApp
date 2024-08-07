
import 'package:flutter/material.dart';

import '../../../core/core_exports.dart';

class Primarytextformfield extends StatelessWidget {
  final String hintText;
  final String? prefixIcon;
  final Icon? suffixIcon;
  final TextInputAction? imeAction;
  final TextInputType? keyboardType;
  final bool? isSecureTextField;
  final String? Function(String?)? validator;
  final TextEditingController ctr;

  const Primarytextformfield(
      {super.key,
      required this.hintText,
        required this.ctr,
      this.suffixIcon,
      this.prefixIcon,
      this.imeAction,
      this.keyboardType,
      this.isSecureTextField,
      this.validator
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primary,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3), bottomLeft: Radius.circular(3)),
            child: Container(
              width: 40,
              color: AppColors.primary,
              height: 50,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                    height: 20,
                    width: 20,
                    child: prefixIcon != null ? Image.asset(prefixIcon!) : Center()),
              ),
            ),
          ),
          Expanded(

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                controller: ctr,
                keyboardType:
                    keyboardType != null ? keyboardType : TextInputType.text,
                textInputAction:
                    imeAction != null ? imeAction : TextInputAction.done,
                obscureText:
                    isSecureTextField != null ? isSecureTextField! : false,
                validator: validator,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
