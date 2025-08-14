import 'package:flutter/material.dart';

class Helper {
  Helper._privateConstructor();
  static final Helper _instance = Helper._privateConstructor();
  factory Helper() => _instance;

  static String usd(num v) {
    final s = v.toStringAsFixed(0);
    final buf = StringBuffer();
    int c = 0;
    for (int i = s.length - 1; i >= 0; i--) {
      buf.write(s[i]);
      c++;
      if (c == 3 && i != 0) {
        buf.write(',');
        c = 0;
      }
    }
    return '\$${buf.toString().split('').reversed.join()}';
  }

  static Widget dotSeparator(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        '•',
        style: TextStyle(color: colorScheme.onPrimary, fontSize: 14),
      ),
    );
  }

}