import 'package:flutter/cupertino.dart';

class CenterIndicator extends StatelessWidget {
  const CenterIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(),
    );
  }
}
