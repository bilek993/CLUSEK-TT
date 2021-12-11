import 'package:clusek_tt/resources/app_colors.dart';
import 'package:flutter/material.dart';

class OutlinedDropdownButton extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String> onItemChanged;

  const OutlinedDropdownButton({
    Key? key,
    required this.items,
    required this.onItemChanged,
  }) : super(key: key);

  @override
  State<OutlinedDropdownButton> createState() =>
      _OutlinedDropdownButtonState(items.first);
}

class _OutlinedDropdownButtonState extends State<OutlinedDropdownButton> {
  String currentValue;

  _OutlinedDropdownButtonState(this.currentValue);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(color: AppColors.separatorColor)),
      child: DropdownButton<String>(
        iconSize: 0.0,
        value: currentValue,
        elevation: 16,
        style: const TextStyle(color: AppColors.white),
        underline: const SizedBox(),
        onChanged: _onValueChangedEvent,
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  void _onValueChangedEvent(String? newValue) {
    if (newValue == null) {
      return;
    }

    widget.onItemChanged(newValue);
    setState(() {
      currentValue = newValue;
    });
  }
}
