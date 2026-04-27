import 'package:calculator_app/Component/calculator_body.dart';
import 'package:calculator_app/Component/calculator_display.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CalculatorScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Calculator'),
      // ),
      backgroundColor: Color(0XFFC3B0E2),
      body:Column(
        children: [
          CalculatorDisplay(),
          Expanded(child: CalculatorBody()),
        ],
      )
    );

  }
}