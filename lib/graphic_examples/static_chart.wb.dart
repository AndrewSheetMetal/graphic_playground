// ignore_for_file: library_prefixes, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:widgetbook/widgetbook.dart' as wb;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Static Chart', type: Chart)
Widget staticChart(BuildContext context) {
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
  ];

  final element1 = context.knobs.options<GeomElement<Shape>>(
    label: "Simple First Element",
    options: [
      wb.Option(
        label: "IntervalElement",
        value: IntervalElement(),
      ),
      wb.Option(
        label: "AreaElement",
        value: AreaElement(),
      ),
      wb.Option(
        label: "PointElement",
        value: PointElement(),
      ),
      wb.Option(
        label: "LineElement",
        value: LineElement(),
      ),
      wb.Option(
        label: "PolygonElement (Heatmap)",
        value: PolygonElement(),
      ),
      wb.Option(
        label: "none",
        value: PointElement(size: SizeAttr(value: 0)),
      ),
    ],
  );

  final element2 = context.knobs.options<GeomElement<Shape>>(
    label: "Advanced Second Element",
    options: [
      wb.Option(
        label: "none",
        value: PointElement(size: SizeAttr(value: 0)),
      ),
      wb.Option(
        label: "Point Element with size based on value",
        value: PointElement(
          color: ColorAttr(
            value: Colors.green,
          ),
          size: SizeAttr(
            encoder: ((p0) => p0["sales"] * 1.0), //take the sales argument and transform it to the size of the element
          ),
        ),
      ),
      wb.Option(
        label: "Point Element with label",
        value: PointElement(
          color: ColorAttr(
            value: Colors.green,
          ),
          label: LabelAttr(
            encoder: (Map<String, dynamic> data) => Label(
              data['sales'].toString(),
              LabelStyle(
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ),
      //TODO: What does Position do?
      // wb.Option(
      //   label: "Point Element with position",
      //   value: PointElement(
      //     color: ColorAttr(
      //       value: Colors.green,
      //     ),
      //     position: Varset("Varset"),
      //   ),
      // ),
      wb.Option(
        label: "Point Element with custom Shape ",
        value: PointElement(
          color: ColorAttr(
            value: Colors.green,
          ),
          shape: ShapeAttr(
            value: SquareShape(strokeWidth: 40),
          ),
        ),
      ),

      wb.Option(
        label: "IntervalElement with rounded corners",
        value: IntervalElement(
          shape: ShapeAttr(
            value: RectShape(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    ],
  );

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
      element1,
      element2,
    ],
    axes: [
      Defaults.horizontalAxis,
      Defaults.verticalAxis,
      //Defaults.radialAxis,
    ],
    coord: coord, //we need to set PolarCoords to get a PieChart
  );
}
