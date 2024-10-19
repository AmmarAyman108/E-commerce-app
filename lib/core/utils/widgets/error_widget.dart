import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
  const CustomErrorWidget({
    super.key,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: const TextStyle(color: Color.fromARGB(255, 255, 17, 0)),
      ),
    );
  }
}
