import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchViewAppBar extends StatelessWidget {
  const SearchViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        Padding(
          padding: const EdgeInsets.only(left: (5)),
          child: Text(
            "Search",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
