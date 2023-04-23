import 'package:flutter/material.dart';

void main() => runApp(Calculadora());

class Calculadora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      home: CalculadoraHome(),
    );
  }
}

class CalculadoraHome extends StatefulWidget {
  @override
  _CalculadoraHomeState createState() => _CalculadoraHomeState();
}

class _CalculadoraHomeState extends State<CalculadoraHome> {
  String displayText = '';
  double n1 = 0.0;
  double n2 = 0.0;
  String operand = '';

  void buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      displayText = '';
      n1 = 0.0;
      n2 = 0.0;
      operand = '';
    } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
      n1 = double.parse(displayText);
      operand = buttonText;
      displayText = '';
    } else if (buttonText == '.') {
      if (displayText.contains('.')) {
        return;
      } else {
        displayText += buttonText;
      }
    } else if (buttonText == '=') {
      n2 = double.parse(displayText);
      if (operand == '+') {
        displayText = (n1 + n2).toString();
      }
      if (operand == '-') {
        displayText = (n1 - n2).toString();
      }
      if (operand == '*') {
        displayText = (n1 * n2).toString();
      }
      if (operand == '/') {
        displayText = (n1 / n2).toString();
      }
      n1 = 0.0;
      n2 = 0.0;
      operand = '';
    } else {
      displayText += buttonText;
    }
    setState(() {
      displayText = displayText;
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(24.0),
              alignment: Alignment.bottomRight,
              child: Text(
                displayText,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
              buildButton('/'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('*'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('-'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('.'),
              buildButton('0'),
              buildButton('00'),
              buildButton('+'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('C'),
              buildButton('='),
            ],
          ),
        ],
      ));
      }}