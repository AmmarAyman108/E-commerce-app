import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  void Function(String)? onSubmitted;
  Function(String)? onChanged;
  CustomTextField({
    super.key,
    this.controller,
    this.onSubmitted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(18),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50000),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50000),
        ),
        hintText: 'Search For Product',
        fillColor: const Color.fromARGB(255, 230, 230, 230),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50000),
        ),
      ),
    );
  }
}
