import 'package:fluent_ui/fluent_ui.dart' hide TextButton;
import 'package:flutter/material.dart' show TextButton;
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PrintButton extends StatelessWidget {
  const PrintButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        final printer = await Printing.pickPrinter(context: context);
        Printing.directPrintPdf(
          printer: printer!,
          onLayout: (pdfPageForm) {
            // Create a PDF document.
            final doc = pw.Document();

            // Add page to the PDF
            doc.addPage(
              pw.MultiPage(
                build: (context) => [
                  pw.Text(
                    'Invoice to:',
                  ),
                ],
              ),
            );

            // Return the PDF file content

            return doc.save();
          },
        );
      },
      icon: const Icon(FluentIcons.print),
      label: const Text(
        'Εκτύπωση',
      ),
    );
  }
}
