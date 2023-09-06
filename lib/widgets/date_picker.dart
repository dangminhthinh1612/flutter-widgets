import "package:flutter/material.dart";
import "package:intl/intl.dart" as intl;

class DatePicker extends StatefulWidget {
  final DateTime date;
  final ValueChanged<DateTime> onChange;

  const DatePicker({super.key, required this.date, required this.onChange});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late TextEditingController datePickerController;

  @override
  void initState() {
    super.initState();
    datePickerController = TextEditingController(
      text: intl.DateFormat("E, d/M/y").format(widget.date),
    );
  }

  @override
  void dispose() {
    datePickerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Select date"),
      readOnly: true,
      controller: datePickerController,
      onTap: () async {
        final newDate = await showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
          initialDate: widget.date,
        );

        if (newDate == null) return;

        widget.onChange(newDate);

        datePickerController.text = intl.DateFormat("E, d/M/y").format(newDate);
      },
    );
  }
}
