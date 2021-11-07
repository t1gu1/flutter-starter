import 'package:flutter/material.dart';
import 'package:flutter_starter/constants/app_themes.dart';

enum SectionType {
  fullWidth,
  fullWidthWithPadding,
  withPadding,
}

class Section extends StatelessWidget {
  Section({required this.type, this.child = null}) {
    switch (type) {
      case SectionType.fullWidth:
        break;
      case SectionType.fullWidthWithPadding:
        padding = AppThemes.sectionPadding;
        break;
      case SectionType.withPadding:
        padding = AppThemes.sectionPadding;
        maxWidth = AppThemes.sectionWidth;
        break;
    }
  }

  final SectionType type;
  final Widget? child;
  double padding = 0;
  double maxWidth = double.infinity;

  @override
  Widget build(BuildContext context) {
    print(type);

    return Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: child,
        ));
  }
}