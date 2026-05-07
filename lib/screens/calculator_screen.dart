import 'package:calculator_app/Component/calculator_body.dart';
import 'package:calculator_app/Component/calculator_display.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CalculatorScreen> {
  String past = "";
  String current = "0";
  String previous = "";
  String operator = "";

  void onButtonPressed(String value) {
    setState(() {
      // if the c button was touched remove one number
      if (value == 'C'){
        if(current == "Error") {
          current = "0";
          past = "";
        }
        else if (current.length > 1) {
          current = current.substring(0, current.length -1);
        } else {
          current = '0';
        }
        return;
      }
      //reset if error
      if (current == "Error") {
        current = "0";
      }

      //prevent multiple decimals
      if (value == "." && current.contains(".")) return;

      //operators handling(+,-,x,/)
      if(value == "\u00F7" || value == "\u00D7" || value == "\u2212" || value == "\u002B") {
        previous = current;
        operator = value;
        past = "$previous $operator";
        current = "0";
        return;
      }

      //performing the operation
      if(value == '=') {
        if (previous.isEmpty || operator.isEmpty) return;

        double num1 = double.parse(previous);
        double num2 = double.parse(current);
        double result = 0;

        switch (operator) {
          case "\u002B":
            result = num1 + num2;
            break;
          case "\u2212":
            result = num1 - num2;
            break;
          case "\u00D7":
            result = num1 * num2;
            break;
          case "\u00F7":
            if(num2 == 0) {
              current = "Error";
              previous = "";
              operator = "";
              return;
            }
            result = num1 / num2;
            break;
        }

        current = result.toString();
        past = "";
        previous = "";
        operator = "";
        return;
      }

      //remove 0, when you start typing
      if (current == "0") {
      current = value;} else {
        current += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Calculator'),
      // ),
      backgroundColor: Color(0XFFC3B0E2),
      body:Column(
        children: [
          CalculatorDisplay(past: past, current: current,),
          Expanded(child: CalculatorBody(onPressed: onButtonPressed,)),
        ],
      )
    );

  }
}