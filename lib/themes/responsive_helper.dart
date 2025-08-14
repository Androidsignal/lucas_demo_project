import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveHelper {
  static const String kTablet = TABLET;
  static const String kMobile = MOBILE;
  static const String kDesktop = DESKTOP;

  static double getValue(
    BuildContext context, {
    double defaultValue = 24,
    double? tabletValue,
    double? mobileValue,
    double? webValue,
  }) {
    final conditions = [
      if (tabletValue != null) Condition.equals(name: kTablet, value: tabletValue),
      if (mobileValue != null) Condition.equals(name: kMobile, value: mobileValue),
      if (webValue != null) Condition.equals(name: kDesktop, value: mobileValue),
    ];
    return ResponsiveValue<double>(
      context,
      defaultValue: defaultValue,
      conditionalValues: conditions,
    ).value;
  }

  // Layout paddings/margins
      static double padding(BuildContext context,
              {double defaultValue = 24, double tabletValue = 18, double mobileValue = 12, double? webValue}) =>
          getValue(context, defaultValue: defaultValue, tabletValue: tabletValue, mobileValue: mobileValue, webValue: webValue);

      // Headline/Display
      static double display(BuildContext context,
              {double defaultValue = 40, double tabletValue = 32, double mobileValue = 28, double? webValue}) =>
          getValue(context, defaultValue: defaultValue, tabletValue: tabletValue, mobileValue: mobileValue, webValue: webValue);

      static double headline(BuildContext context,
              {double defaultValue = 28, double tabletValue = 24, double mobileValue = 20, double? webValue}) =>
          getValue(context, defaultValue: defaultValue, tabletValue: tabletValue, mobileValue: mobileValue, webValue: webValue);

      // Title
      static double titleLarge(BuildContext context,
              {double defaultValue = 20, double tabletValue = 18, double mobileValue = 16, double? webValue}) =>
          getValue(context, defaultValue: defaultValue, tabletValue: tabletValue, mobileValue: mobileValue, webValue: webValue);

      static double title(BuildContext context,
              {double defaultValue = 18, double tabletValue = 16, double mobileValue = 14, double? webValue}) =>
          getValue(context, defaultValue: defaultValue, tabletValue: tabletValue, mobileValue: mobileValue, webValue: webValue);

      static double titleSmall(BuildContext context,
              {double defaultValue = 16, double tabletValue = 14, double mobileValue = 12, double? webValue}) =>
          getValue(context, defaultValue: defaultValue, tabletValue: tabletValue, mobileValue: mobileValue, webValue: webValue);

      // Body
      static double bodyLarge(BuildContext context,
              {double defaultValue = 16, double tabletValue = 14, double mobileValue = 12, double? webValue}) =>
          getValue(context, defaultValue: defaultValue, tabletValue: tabletValue, mobileValue: mobileValue, webValue: webValue);

      static double body(BuildContext context,
              {double defaultValue = 14, double tabletValue = 12, double mobileValue = 10, double? webValue}) =>
          getValue(context, defaultValue: defaultValue, tabletValue: tabletValue, mobileValue: mobileValue, webValue: webValue);

      static double bodySmall(BuildContext context,
              {double defaultValue = 12, double tabletValue = 10, double mobileValue = 8, double? webValue}) =>
          getValue(context, defaultValue: defaultValue, tabletValue: tabletValue, mobileValue: mobileValue, webValue: webValue);

      // Caption/Label
      static double caption(BuildContext context,
              {double defaultValue = 11, double tabletValue = 10, double mobileValue = 8, double? webValue}) =>
          getValue(context, defaultValue: defaultValue, tabletValue: tabletValue, mobileValue: mobileValue, webValue: webValue);

      static double labelMedium(BuildContext context,
              {double defaultValue = 14, double tabletValue = 12, double mobileValue = 10, double? webValue}) =>
          getValue(context, defaultValue: defaultValue, tabletValue: tabletValue, mobileValue: mobileValue, webValue: webValue);

      static double labelSmall(BuildContext context,
              {double defaultValue = 12, double tabletValue = 10, double mobileValue = 8, double? webValue}) =>
          getValue(context, defaultValue: defaultValue, tabletValue: tabletValue, mobileValue: mobileValue, webValue: webValue);

      // Button
      static double button(BuildContext context,
              {double defaultValue = 16, double tabletValue = 14, double mobileValue = 12, double? webValue}) =>
          getValue(context, defaultValue: defaultValue, tabletValue: tabletValue, mobileValue: mobileValue, webValue: webValue);

      // Icon
      static double icon(BuildContext context,
              {double defaultValue = 24, double tabletValue = 20, double mobileValue = 18, double? webValue}) =>
          getValue(context, defaultValue: defaultValue, tabletValue: tabletValue, mobileValue: mobileValue, webValue: webValue);

      // Amount (for large numbers)
      static double amount(BuildContext context, {double defaultValue = 34, double tabletValue = 28, double? webValue}) =>
          getValue(context, defaultValue: defaultValue, tabletValue: tabletValue, webValue: webValue);
}
