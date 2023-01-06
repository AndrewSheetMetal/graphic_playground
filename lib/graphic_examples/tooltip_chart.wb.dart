// ignore_for_file: library_prefixes, depend_on_referenced_packages

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:widgetbook/widgetbook.dart' as wb;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'ToolTips', type: Chart)
Widget tooltipChart(BuildContext context) {
  const data = [
    {
      'category': 'Shirts',
      'sales': 5,
    },
    {
      'category': 'Cardigans',
      'sales': 20,
    },
    {'category': 'Chiffons', 'sales': 36},
    {'category': 'Pants', 'sales': 10},
    {'category': 'Heels', 'sales': 10},
    {'category': 'Socks', 'sales': 20},
    {'category': 'Shoes', 'sales': 10},
  ];

  var followPointer = context.knobs.boolean(
    label: "Follow Pointer",
    description: "Does the ToolTip Dialog follows the position of the mouse cursor",
    initialValue: false,
  );

  var singleTooltipForDistinctYValues = context.knobs.boolean(
    label: "Show tooltip for distinct y-values",
    description: "If true, there is just one single tooltip for each distinct y-value",
    initialValue: false,
  );

  var onlyIfNearEnough = context.knobs.boolean(
    label: "Show if near enough",
    description: "If true, the tooltip is only shown if the cursor is near to a data point",
    initialValue: true,
  );

  var showCrossHair = context.knobs.boolean(
    label: "Show cross hair",
    description: "If true, the current pointer is rendered with horizontal and vertical lines",
    initialValue: false,
  );

  return Chart(
    data: data,
    rebuild: true,
    variables: {
      'category': Variable(
        accessor: (Map map) => map['category'] as String,
      ),
      'sales': Variable(
        accessor: (Map map) => map['sales'] as num,
      ),
    },
    elements: [
      LineElement(
        shape: ShapeAttr(
          value: BasicLineShape(smooth: true),
        ),
      ),
      PointElement(),
    ],
    axes: [
      Defaults.horizontalAxis,
      Defaults.verticalAxis,
    ],
    coord: RectCoord(),
    selections: {
      //? How does IntervalSelection work?
      'tooltipMouse': PointSelection(
        on: {
          GestureType.hover,
        },
        clear: {
          GestureType.tapDown, //Tooltip disappears if the user clicks
        },
        devices: {PointerDeviceKind.mouse},
        variable: singleTooltipForDistinctYValues ? 'sales' : null,
        testRadius: 10,
        nearest: !onlyIfNearEnough,
      ),
    },
    tooltip: TooltipGuide(
      followPointer: [
        followPointer,
        followPointer,
      ],
      align: Alignment.topLeft,
      variables: ['sales', 'category'], //!: You need 2+ variables here for
      radius: const Radius.circular(10), //borderRadius
      elevation: 5.0, //shadow
    ),
    crosshair: showCrossHair
        ? CrosshairGuide(
            styles: [
              //! we need a stroke style for x and y dimension
              StrokeStyle(color: Colors.red, dash: [5, 10]),
              StrokeStyle(color: Colors.red, dash: [10, 5]),
            ],
          )
        : null,
  );
}
