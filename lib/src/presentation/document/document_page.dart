import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:scale_flutter/src/presentation/document/widgets/gross_net_widget.dart';
import 'package:scale_flutter/src/presentation/document/widgets/print_button.dart';

import '../../data/dependency_injection.dart';
import '../common/styling/padding_constants.dart';
import 'bloc/document_bloc.dart';
import 'widgets/document_form.dart';

class DocumentPage extends StatelessWidget {
  const DocumentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DocumentBloc>()..add(LoadVehiclesEvent()),
      child: ScaffoldPage(
        header: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              PrintButton(),
            ],
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: const [
              Flexible(
                child: GrossNetWidget(),
              ),
              paddingVerticalL,
              Flexible(
                flex: 3,
                child: DocumentForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
