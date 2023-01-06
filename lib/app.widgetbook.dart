// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'dart:async';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphic/src/chart/size.dart';
import 'package:graphic/src/chart/view.dart';
import 'package:graphic/src/coord/coord.dart';
import 'package:graphic/src/coord/polar.dart';
import 'package:graphic/src/coord/rect.dart';
import 'package:graphic/src/data/data_set.dart';
import 'package:graphic/src/geom/element.dart';
import 'package:graphic/src/guide/annotation/annotation.dart';
import 'package:graphic/src/guide/axis/axis.dart';
import 'package:graphic/src/guide/interaction/crosshair.dart';
import 'package:graphic/src/guide/interaction/tooltip.dart';
import 'package:graphic/src/interaction/gesture.dart';
import 'package:graphic/src/interaction/selection/selection.dart';
import 'package:graphic/src/util/collection.dart';
import 'package:graphic/src/variable/transform/transform.dart';
import 'package:graphic/src/variable/variable.dart';
import 'package:graphic_example/app.dart';
import 'package:graphic_example/graphic_examples/annotation_chart.wb.dart';
import 'package:graphic_example/graphic_examples/interactive_heatmap.wb.dart';
import 'package:graphic_example/graphic_examples/interactive_region_selection.wb.dart';
import 'package:graphic_example/graphic_examples/static_chart.wb.dart';
import 'package:graphic_example/graphic_examples/tooltip_chart.wb.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      appInfo: AppInfo(
        name: 'Graphic Playground',
      ),
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: getLightTheme(),
        ),
      ],
      devices: [
        Device(
          name: 'iPhone 12',
          resolution: Resolution(
            nativeSize: DeviceSize(
              height: 2532.0,
              width: 1170.0,
            ),
            scaleFactor: 3.0,
          ),
          type: DeviceType.mobile,
        ),
        Device(
          name: 'iPhone 12 Mini',
          resolution: Resolution(
            nativeSize: DeviceSize(
              height: 2436.0,
              width: 1125.0,
            ),
            scaleFactor: 3.0,
          ),
          type: DeviceType.mobile,
        ),
      ],
      frames: [
        WidgetbookFrame(
          name: 'Widgetbook',
          allowsDevices: true,
        ),
      ],
      textScaleFactors: [
        1.0,
        2.0,
        3.0,
      ],
      categories: [
        WidgetbookCategory(
          name: 'use cases',
          folders: [
            WidgetbookFolder(
              name: 'chart',
              widgets: [
                WidgetbookComponent(
                  name: 'Chart<dynamic>',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Static Chart',
                      builder: (context) => staticChart(context),
                    ),
                    WidgetbookUseCase(
                      name: 'ToolTips',
                      builder: (context) => tooltipChart(context),
                    ),
                    WidgetbookUseCase(
                      name: 'Annotations',
                      builder: (context) => annotationChart(context),
                    ),
                    WidgetbookUseCase(
                      name: 'Interactive Headmap',
                      builder: (context) => interactiveHeatmap(context),
                    ),
                    WidgetbookUseCase(
                      name: 'Interactive Region Selection',
                      builder: (context) => interactiveRegionSelection(context),
                    ),
                  ],
                  isExpanded: true,
                ),
              ],
              folders: [],
              isExpanded: true,
            ),
          ],
          widgets: [],
        ),
      ],
    );
  }
}
