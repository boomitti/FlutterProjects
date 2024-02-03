import 'package:flutter/material.dart';
import 'service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _input = '';
  double _result = 0.0;

  void _updateInput(String value) {
    setState(() {
      _input += value;
    });
  }

  void _clearInput() {
    setState(() {
      _input = '';
      _result = 0.0;
    });
  }

  void _calculateResult() {
    try {
      setState(() {
        _result = eval(_input);
        _input = _result.toString();
      });
    } catch (e) {
      setState(() {
        _input = 'Error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Web Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  _input,
                  style: TextStyle(fontSize: 32.0),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('0'),
              _buildButton('.'),
              _buildButton('='),
              _buildButton('+'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('C', color: Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, {Color? color}) {
    return ElevatedButton(
      onPressed: () {
        if (text == '=') {
          _calculateResult();
        } else if (text == 'C') {
          _clearInput();
        } else {
          _updateInput(text);
        }
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 24.0),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.blue,
        padding: EdgeInsets.all(20.0),
      ),
    );
  }
}
