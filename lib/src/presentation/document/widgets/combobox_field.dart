import 'package:fluent_ui/fluent_ui.dart';

class ComboboxField<T> extends StatelessWidget {
  final String placeHolder;
  final T? value;
  final List<T> items;
  final void Function(T?)? onSelected;
  const ComboboxField({
    Key? key,
    required this.items,
    this.onSelected,
    this.placeHolder = '',
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Combobox<T>(
      placeholder: Text(
        placeHolder,
      ),
      isExpanded: true,
      items: items
          .map(
            (e) => ComboboxItem<T>(
              child: Text(
                e.toString(),
              ),
              value: e,
            ),
          )
          .toList(),
      onChanged: onSelected,
    );
  }
}
