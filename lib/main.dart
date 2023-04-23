import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  double _result = 0.0;
  String _input = "";

  void _addToInput(String value) {
    setState(() {
      _input += value;
    });
  }

  void _clearInput() {
    setState(() {
      _input = "";
    });
  }

  void _toggleNegative() {
    setState(() {
      if (_input.startsWith("-")) {
        _input = _input.substring(1);
      } else {
        _input = "-" + _input;
      }
    });
  }

  void _calculate() {
    setState(() {
      _result = double.parse(_input);
      _input = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _input,
              style: TextStyle(fontSize: 36),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _result.toString(),
              style: TextStyle(fontSize: 36),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  _addToInput("7");
                },
                child: Text("7"),
              ),
              ElevatedButton(
                onPressed: () {
                  _addToInput("8");
                },
                child: Text("8"),
              ),
              ElevatedButton(
                onPressed: () {
                  _addToInput("9");
                },
                child: Text("9"),
              ),
              ElevatedButton(
                onPressed: () {
                  _addToInput("+");
                },
                child: Text("+"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  _addToInput("4");
                },
                child: Text("4"),
              ),
              ElevatedButton(
                onPressed: () {
                  _addToInput("5");
                },
                child: Text("5"),
              ),
              ElevatedButton(
                onPressed: () {
                  _addToInput("6");
                },
                child: Text("6"),
              ),
              ElevatedButton(
                onPressed: () {
                  _addToInput("-");
                },
                child: Text("-"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  _addToInput("1");
                },
                child: Text("1"),
              ),
              ElevatedButton(
                onPressed: () {
                  _addToInput("2");
                },
                child: Text("2"),
              ),
              ElevatedButton(
                onPressed: () {
                  _addToInput("3");
                },
                child: Text("3"),
              ),
              ElevatedButton(
                onPressed: () {
                  _addToInput("*");
                },
                child: Text("*"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  _clearInput();
                },
                child: Text("C"),
              ),
              ElevatedButton(
                onPressed: () {
                  _addToInput("0");
                },
                child: Text("0"),
              ),
              ElevatedButton(
                onPressed: () {
                  _toggleNegative();
                },
                child: Text("+/-"),
              ),
              ElevatedButton(
                onPressed: () {
                  _addToInput("/");
                },
                child: Text("/"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  _calculate();
                },
                child: Text("="),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

             
