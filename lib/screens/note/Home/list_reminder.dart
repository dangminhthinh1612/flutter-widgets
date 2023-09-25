import 'package:flutter/material.dart';

class ListReminder extends StatefulWidget {
  const ListReminder({super.key});

  @override
  State<ListReminder> createState() => _ListReminderState();
}

class _ListReminderState extends State<ListReminder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text('Reminder'),
    );
  }
}
