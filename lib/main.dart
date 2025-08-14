import 'package:flutter/material.dart';
import 'package:lucas_demo_project/ui/archive_screen/archive_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Archive App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: ArchiveScreen.routeName,
      builder: (context, widget) => ResponsiveBreakpoints.builder(
        child: widget!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: double.infinity, name: DESKTOP),
        ],
      ),
      routes: {
        ArchiveScreen.routeName: (context) => ArchivePage(),
      },
    );
  }
}
