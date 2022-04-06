import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scale_flutter/src/presentation/document/widgets/document_field.dart';

import '../../../core/features/vehicle/entities/vehicle.dart';
import '../bloc/document_bloc.dart';
import 'combobox_field.dart';

class DocumentForm extends StatelessWidget {
  const DocumentForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocumentBloc, DocumentState>(
      builder: (context, state) {
        return Form(
          child: ListView(
            children: [
              DocumentField(
                header: 'Αριθμός παραστατικού',
                initialValue: state.document.documentNumber,
                onChanged: (val) {
                  context.read<DocumentBloc>().add(DocNumberChanged(val));
                },
              ),
              ComboboxField<Vehicle>(
                placeHolder: 'Πινακίδα αυτοκινήτου',
                value: state.document.vehicle,
                items: state.vehicles,
                onSelected: (val) {
                  print(val);
                },
              ),
              TextBox(
                header: 'Οργανισμός',
              ),
              TextBox(
                header: 'Οδηγός',
              ),
              TextBox(
                header: 'Οργανισμός',
              ),
              TextBox(
                header: 'Καθαρό Βάρος',
              ),
              TextBox(
                header: 'Μικτό βάρος',
              ),
              TextBox(
                header: 'Απόβαρο',
              ),
            ],
          ),
        );
      },
    );
  }
}
