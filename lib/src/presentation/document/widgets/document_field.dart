import 'package:fluent_ui/fluent_ui.dart';

typedef OnChanged = void Function(String?);

class DocumentField extends StatelessWidget {
  final String header;
  final String initialValue;
  final String? placeHolder;
  final OnChanged? onChanged;
  const DocumentField({
    Key? key,
    required this.header,
    this.initialValue = '',
    this.placeHolder,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormBox(
      header: header,
      initialValue: initialValue,
      placeholder: placeHolder,
      onChanged: onChanged,
    );
  }
}
