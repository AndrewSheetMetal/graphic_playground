// ignore_for_file: library_prefixes, depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:graphic_example/data.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Interactive Headmap', type: Chart)
Widget interactiveHeatmap(BuildContext context) {
  final heatmapChannel = StreamController<Selected?>.broadcast();

  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(top: 10),
        width: 350,
        height: 200,
        child: Chart(
          padding: (_) => EdgeInsets.zero,
          data: heatmapData,
          variables: {
            'name': Variable(
              accessor: (List datum) => datum[0].toString(),
            ),
            'day': Variable(
              accessor: (List datum) => datum[1].toString(),
            ),
            'sales': Variable(
              accessor: (List datum) => datum[2] as num,
            ),
          },
          elements: [
            PolygonElement(
              shape: ShapeAttr(value: HeatmapShape(sector: true)),
              color: ColorAttr(
                variable: 'sales',
                values: [const Color(0xffbae7ff), const Color(0xff1890ff), const Color(0xff0050b3)],
                updaters: {
                  'tap': {false: (color) => color.withAlpha(70)}
                },
              ),
              selectionChannel: heatmapChannel,
            )
          ],
          coord: PolarCoord(),
          selections: {'tap': PointSelection()},
          tooltip: TooltipGuide(
            anchor: (_) => Offset.zero,
            align: Alignment.bottomRight,
          ),
        ),
      ),
      const SizedBox(
        height: 50,
      ),
      Container(
        margin: const EdgeInsets.only(top: 10),
        width: 350,
        height: 100,
        child: Chart(
          padding: (_) => EdgeInsets.zero,
          data: heatmapData,
          variables: {
            'name': Variable(
              accessor: (List datum) => datum[0].toString(),
            ),
            'day': Variable(
              accessor: (List datum) => datum[1].toString(),
            ),
            'sales': Variable(
              accessor: (List datum) => datum[2] as num,
            ),
          },
          elements: [
            PolygonElement(
              color: ColorAttr(
                variable: 'sales',
                values: [
                  Colors.green,
                  Colors.yellow,
                  Colors.red,
                ],
                updaters: {
                  'tap': {false: (color) => color.withAlpha(70)},
                },
              ),
              selectionChannel: heatmapChannel,
            )
          ],
          selections: {
            'tap': PointSelection(
              on: {
                GestureType.hover,
              },
            ),
          },
        ),
      ),
    ],
  );
}
