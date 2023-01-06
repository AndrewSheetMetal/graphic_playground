// ignore_for_file: library_prefixes, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:widgetbook/widgetbook.dart' as wb;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Annotations', type: Chart)
Widget annotationChart(BuildContext context) {
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

  final coord = context.knobs.options<Coord>(
    label: "Coordinate",
    options: [
      wb.Option(
        label: "RectCoord",
        value: RectCoord(),
      ),
      wb.Option(
        label: "PolarCoord",
        value: PolarCoord(),
      ),
    ],
  );

  var annotation = context.knobs.options<Annotation>(
    label: "Annotation",
    options: [
      wb.Option(
        label: "Tag-Annotation",
        value: TagAnnotation(
          //shows a label at a specific position
          label: Label(
            'Tag-Annotation',
            LabelStyle(
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
          values: ["Pants", 15],
        ),
      ),
      wb.Option(
        label: "Vertical Line",
        value: LineAnnotation(
          // vertical line
          variable: "category",
          value: "Cardigans",
          style: StrokeStyle(
            color: Colors.green,
            width: 2.0,
            dash: [5, 5],
          ),
        ),
      ),
      wb.Option(
        label: "Horizontal Line",
        value: LineAnnotation(
          //horizontal line
          variable: "sales",
          value: 25.0,
          style: StrokeStyle(
            color: Colors.green,
            width: 2.0,
            dash: [5, 5],
          ),
          dim: Dim.y,
        ),
      ),
      wb.Option(
        label: "Region y-Range",
        value: RegionAnnotation(
          variable: "sales",
          values: [10.0, 15.0],
          color: const Color.fromARGB(120, 255, 173, 177),
          dim: Dim.y,
        ),
      ),
      wb.Option(
        label: "Region x-Range",
        value: RegionAnnotation(
          variable: "category",
          values: ["Pants", "Heels"],
          color: Colors.blueGrey.withOpacity(0.3),
          dim: Dim.x,
        ),
      ),
      wb.Option(
        label: "Mark Circle",
        value: MarkAnnotation(
          relativePath: Paths.circle(center: Offset.zero, radius: 15),
          style: Paint()..color = const Color(0xff91cc75),
          values: ['Cardigans', 20],
        ),
      ),
      wb.Option(
        label: "Mark PolyLine",
        value: MarkAnnotation(
          relativePath: Paths.polyline(
            points: const [
              Offset(12.0, 12.0),
              Offset(24.0, 32.0),
              Offset(50.0, 12.0),
            ],
            smooth: true,
          ),
          style: Paint()..color = const Color(0xff91cc75),
          values: ['Cardigans', 20],
        ),
      ),
      //? How does CustomAnnotation work?
      wb.Option(
        label: "Custom Annotation",
        value: CustomAnnotation(
          values: ['Cardigans', 20],
          renderer: (Offset o, Size s) {
            var textPainter = TextPainter(
              text: const TextSpan(
                text: "Rotated Text",
                style: TextStyle(color: Colors.redAccent),
              ),
              textDirection: TextDirection.ltr,
            );

            textPainter.layout();

            var figure = RotatedTextFigure(
              textPainter,
              o,
              0.2,
              const Offset(0, 0),
            );

            return [figure];
          },
        ),
      ),
    ],
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
    coord: coord,
    annotations: [
      annotation,
    ],
  );
}
