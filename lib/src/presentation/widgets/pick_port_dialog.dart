import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scale_flutter/src/presentation/common/styling/padding_constants.dart';

import '../scale/bloc/scale_bloc.dart';

Future<String?> showPortDialog(BuildContext context) {
  return showDialog<String>(
      context: context,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Dialog(
            child: BlocBuilder<ScaleBloc, ScaleState>(
              builder: (context, state) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.7,
                      maxWidth: MediaQuery.of(context).size.width * 0.5),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Ports',
                          style: Theme.of(context).textTheme.headline6
                            ?..copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                        ),
                        paddingVerticalL,
                        ...state.availablePorts
                            .map(
                              (e) => ListTile(
                                title: Text(
                                  e,
                                ),
                              ),
                            )
                            .toList()
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      });
}

class PickPortDialog extends StatelessWidget {
  const PickPortDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
