import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Caculator extends StatefulWidget {
  const Caculator({super.key});

  @override
  State<Caculator> createState() => _CaculatorState();
}

class _CaculatorState extends State<Caculator> {
  String _outPut = "0";
  String _realInPut = "";

  void _onPress(String button) {
    setState(() {
      if (button == "=") {
        _calculate();
      } else if (button == "C") {
        _outPut = "0";
      } else if (button == "⌫") {
        _outPut = _outPut.substring(0, _outPut.length - 1);
        if (_outPut == "") {
          _outPut = "0";
        }
      } else {
        if (_outPut.startsWith("0")) {
          if (button == "000" || button == "0") {
            _outPut = "0";
          } else if (button == ".") {
            _outPut = "0.";
          } else {
            if (_outPut.startsWith("0.")) {
              _outPut += button;
            } else {
              _outPut = _outPut.substring(1);
              _outPut += button;
            }
          }
        } else {
          _outPut += button;
        }
      }
    });
  }

  String _calculate() {
    _realInPut = _outPut.replaceAll('÷', '/');
    _realInPut = _realInPut.replaceAll('×', '*');

    try {
      Parser p = Parser();
      Expression exp = p.parse(_realInPut);
      ContextModel cm = ContextModel();
      return _outPut = exp.evaluate(EvaluationType.REAL, cm).toString();
    } catch (e) {
      return 'Error';
    }
  }

  Widget _buildButton(String button,
      {double aspectRatio = 1, Color color = Colors.grey, int flex = 1,}) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: const EdgeInsets.all(1),
        child: Material(
          color: color,
          child: InkWell(
            onTap: () {
              _onPress(button);
            },
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  button,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20,),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.all(16),
            child: Text(
              _outPut,
              style: const TextStyle(fontSize: 40),
            ),
          ),
        ),
        Row(
          children: [
            _buildButton('C', flex: 2, aspectRatio: 2, color: Colors.orange),
            _buildButton('⌫'),
            _buildButton('÷', color: Colors.green),
          ],
        ),
        Row(
          children: [
            _buildButton('7'),
            _buildButton('8'),
            _buildButton('9'),
            _buildButton('×', color: Colors.green),
          ],
        ),
        Row(
          children: [
            _buildButton('4'),
            _buildButton('5'),
            _buildButton('6'),
            _buildButton('-', color: Colors.green),
          ],
        ),
        Row(
          children: [
            _buildButton('1'),
            _buildButton('2'),
            _buildButton('3'),
            _buildButton('+', color: Colors.green),
          ],
        ),
        Row(
          children: [
            _buildButton('0'),
            _buildButton('000'),
            _buildButton('.'),
            _buildButton('=', color: Colors.orange),
          ],
        ),
      ],
    );
  }
}
