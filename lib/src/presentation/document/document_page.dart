import 'package:fluent_ui/fluent_ui.dart';
import 'package:scale_flutter/src/presentation/document/widgets/gross_net_widget.dart';

import '../common/styling/padding_constants.dart';

class DocumentPage extends StatelessWidget {
  const DocumentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Text('Παραστατικό'),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const Flexible(
              child: GrossNetWidget(),
            ),
            paddingVerticalL,
            Flexible(
              flex: 3,
              child: Form(
                child: ListView(
                  children: const [
                    TextBox(
                      header: 'Αριθμός παραστατικού',
                    ),
                    TextBox(
                      header: 'Πινακίδα αυτοκινήτου',
                      placeholder: 'IZH-2522',
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
