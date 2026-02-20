import 'package:flutter/material.dart';

extension PaddingExtention on Widget {


  Widget setMDQHorizontalPadding({
    required BuildContext context,
    required bool withMedia,
    required double value,
  }) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: withMedia
            ? MediaQuery.of(context).size.width * value
            : value,
      ),
      child: this,
    );
  }
}
