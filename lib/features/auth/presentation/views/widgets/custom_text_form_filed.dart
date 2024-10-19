import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormFiled extends StatefulWidget {
  final String hint;
  final IconData? icon;
  bool obscureText;
  final TextEditingController? controller;

  CustomTextFormFiled({
    super.key,
    required this.hint,
    this.icon,
    this.obscureText = false,
    this.controller,
  });

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "This field is required";
        } else if (value!.length < 8) {
          return "This field must be at least 8 characters";
        }
        {
          return null;
        }
      },
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        suffixIcon: widget.icon == null
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
                icon: Icon(widget.obscureText
                    ? Icons.visibility
                    : Icons.visibility_off))
            : Icon(widget.icon),
        filled: true,
        hintText: widget.hint,
        contentPadding:
            const EdgeInsetsDirectional.symmetric(horizontal: 25, vertical: 20),
        fillColor: ColorManager.gray,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide.none),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide.none),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(500),
          borderSide: const BorderSide(
            color: ColorManager.red,
          ),
        ),
      ),
    );
  }
}
