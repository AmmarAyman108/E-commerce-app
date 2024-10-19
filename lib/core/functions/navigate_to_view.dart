import 'package:flutter/material.dart';

Future navigateToView(BuildContext context, {required String route}) =>
    Navigator.pushNamed(context, route);

dynamic backToPrevious(BuildContext context) => Navigator.pop(context);
