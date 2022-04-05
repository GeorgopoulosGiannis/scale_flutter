import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:scale_flutter/src/presentation/document/widgets/scale_number.dart';

class GrossNetWidget extends StatelessWidget {
  const GrossNetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              children: [
                const Text('Μικτό Βάρος'),
                Flexible(
                  child: ScaleNumber(
                    text: '200.00',
                  ),
                ),
              ],
            ),
          ),
          Text(
            '-',
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          Flexible(
            child: Column(
              children: [
                const Text('Απόβαρο'),
                Flexible(
                  child: ScaleNumber(
                    text: '100.00',
                  ),
                ),
              ],
            ),
          ),
          Text(
            '=',
            style: TextStyle(
              fontSize: 33,
            ),
          ),
          Flexible(
            child: Column(
              children: [
                const Text('Καθαρό βάρος'),
                Flexible(
                  child: ScaleNumber(
                    text: '100.00',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
