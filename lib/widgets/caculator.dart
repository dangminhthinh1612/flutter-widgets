import 'package:flutter/material.dart';

Widget _buildButton(String button) {
  return Expanded(
    child: InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          button,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    ),
  );
}

class Caculator extends StatelessWidget {
  const Caculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Expanded(
        child: Text(''),
      ),
      const Divider(),
      Row(
        children: [
          _buildButton('C'),
          _buildButton('Del'),
        ],
      ),
      Row(
        children: [
          _buildButton('7'),
          _buildButton('8'),
          _buildButton('9'),
          _buildButton('÷'),
        ],
      ),
      Row(
        children: [
          _buildButton('4'),
          _buildButton('5'),
          _buildButton('6'),
          _buildButton('×'),
        ],
      ),
      Row(
        children: [
          _buildButton('1'),
          _buildButton('2'),
          _buildButton('3'),
          _buildButton('-'),
        ],
      ),
      Row(
        children: [
          _buildButton('0'),
          _buildButton('000'),
          _buildButton('.'),
          _buildButton('='),
        ],
      )
    ]);
  }
}
