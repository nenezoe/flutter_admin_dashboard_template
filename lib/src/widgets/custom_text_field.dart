import 'package:flutter/material.dart';

import '../admin/constant/color.dart';
import '../constants/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.margin,
    this.textInputAction,
    this.focusNode,
    this.onChanged,
    this.obsecureText = false,
    this.onTap,
    this.onSubmitted,
    this.keyBoardType,
    this.textCapitalization = TextCapitalization.none,
    this.errorText,
    this.changeColor,
    this.readOnly = false,
    this.onIconTap,
    this.suffixIcon,
    this.validator,
    this.maxLength,
    this.textColor,
  })  : assert(controller != null),
        super(key: key);
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  final TextInputAction? textInputAction;
  final String? hintText;
  final FocusNode? focusNode;
  final bool? obsecureText;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  final TextInputType? keyBoardType;
  final TextCapitalization textCapitalization;
  final String? errorText;
  final bool? changeColor;
  final bool? readOnly;
  final void Function()? onIconTap;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final int? maxLength;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        textInputAction: textInputAction,
        obscureText: obsecureText!,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        maxLines: 1,
        minLines: 1,
        onTap: onTap,
        keyboardType: keyBoardType,
        textCapitalization: textCapitalization,
        cursorColor: Colors.black26,
        style: TextStyle(fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          suffixIconConstraints: const BoxConstraints(minWidth: 30),
          filled: true,
          hintText: hintText,
          fillColor: Colors.white30,
          // fillColor: ColorConst.white,

          hintStyle: const TextStyle(
            color: Color.fromRGBO(85, 85, 85, 1),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          isDense: true,
          isCollapsed: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          suffixIcon: suffixIcon,
          errorText: errorText,
          errorStyle: const TextStyle(fontSize: 11, height: 0.7),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:
                  isDark ? ColorConst.lightFontColor : ColorConst.appbarLightBG,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorConst.lightFontColor),
            borderRadius: BorderRadius.circular(4),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorConst.primary),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        validator: validator,
        maxLength: maxLength,
      ),
    );
  }
}
