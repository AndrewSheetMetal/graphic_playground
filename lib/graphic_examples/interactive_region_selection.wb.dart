// ignore_for_file: library_prefixes, depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:graphic_example/data.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Interactive Region Selection', type: Chart)
Widget interactiveRegionSelection(BuildContext context) {
  final gestureChannel = StreamController<GestureSignal>.broadcast();

  return Column(
    children: [
      const SizedBox(height: 10),
      const Text("Select a region by tap and scale"),
      const SizedBox(height: 10),
      Container(
        margin: const EdgeInsets.only(top: 10),
        width: 350,
        height: 150,
        child: Chart(
          padding: (_) => const EdgeInsets.fromLTRB(40, 5, 10, 0),
          rebuild: false,
          data: priceVolumeData,
          variables: {
            'time': Variable(
              accessor: (Map map) => map['time'] as String,
              scale: OrdinalScale(tickCount: 3),
            ),
            'end': Variable(
              accessor: (Map map) => map['end'] as num,
              scale: LinearScale(min: 5, tickCount: 5),
            ),
          },
          elements: [
            LineElement(
              size: SizeAttr(value: 1),
            )
          ],
          axes: [
            Defaults.horizontalAxis
              ..label = null
              ..line = null,
            Defaults.verticalAxis..gridMapper = (_, index, __) => index == 0 ? null : Defaults.strokeStyle,
          ],
          selections: {
            'areaSelection': IntervalSelection(
              color: Colors.purple.withOpacity(0.3),
              clear: {GestureType.tap},
              dim: Dim.x,
            )
          },
          gestureChannel: gestureChannel,
        ),
      ),
      const SizedBox(
        height: 60,
      ),
      Container(
        margin: const EdgeInsets.only(top: 0),
        width: 350,
        height: 80,
        child: Chart(
          padding: (_) => const EdgeInsets.fromLTRB(40, 0, 10, 20),
          rebuild: false,
          data: priceVolumeData,
          variables: {
            'time': Variable(
              accessor: (Map map) => map['time'] as String,
              scale: OrdinalScale(tickCount: 3),
            ),
            'volume': Variable(
              accessor: (Map map) => map['volume'] as num,
              scale: LinearScale(min: 0),
            ),
          },
          elements: [
            IntervalElement(
              size: SizeAttr(value: 1),
              color: ColorAttr(
                value: Colors.red.withOpacity(0.5),
                updaters: {
                  "areaSelection": {true: (color) => color.withOpacity(1.0)},
                },
              ),
            )
          ],
          axes: [
            Defaults.horizontalAxis,
          ],
          selections: {
            'areaSelection': IntervalSelection(
              color: Colors.transparent,
              clear: {GestureType.tap},
              dim: Dim.x,
              variable: "time",
            ),
          },
          gestureChannel: gestureChannel,
        ),
      ),
    ],
  );
}
