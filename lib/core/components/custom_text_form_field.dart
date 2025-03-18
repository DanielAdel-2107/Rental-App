import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.controller,
    this.enableValidator = true, this.maxLines = 1,  this.perfixIcon, this.onChanged,
  });
  final String hintText;
  final bool isPassword, enableValidator;
  final TextEditingController? controller;
  final int maxLines;
  final Widget ?perfixIcon;
  final Function(String)? onChanged;
  @override
  State<CustomTextFormField> createState() =>
      _CustomTextFormFieldState();
}

class _CustomTextFormFieldState
    extends State<CustomTextFormField> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.enableValidator
          ? (value) =>
              value!.isEmpty ? "Field is required" : null
          : null,
      onChanged:widget. onChanged ,
      obscureText: widget.isPassword ? isPassword : false,
      decoration: InputDecoration(
        prefixIcon: widget.perfixIcon,
        hintText: widget.hintText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.2),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isPassword = !isPassword;
                  });
                },
                icon: Icon(
                  isPassword ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.primaryColor,
                ),
              )
            : null,
      ),
      maxLines: widget.maxLines,
    );
  }
}
