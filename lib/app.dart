import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

//To execute:
//>flutter pub run build_runner watch
//>flutter run -t lib/app.widgetbook.dart -d macos (or start with IDE Configuration "Widgetbook - UI-Components")

@WidgetbookApp.material(
  name: 'Graphic Playground',
  frames: [
    WidgetbookFrame(
      name: 'Widgetbook',
      allowsDevices: true,
    ),
  ],
  devices: [
    Apple.iPhone12,
    Apple.iPhone12Mini,
  ],
  textScaleFactors: [
    1,
    2,
    3,
  ],
  foldersExpanded: true,
  widgetsExpanded: true,
)
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

@WidgetbookTheme(name: 'Light', isDefault: true)
ThemeData getLightTheme() => ThemeData(
      primarySwatch: Colors.blue,
    );
