import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:sampleworkout/widgets/CalcButton.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        appBar: AppBar(
            title: new Center(
                child: new Text("My Tool App Calculator",
                    textAlign: TextAlign.center)),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  _history,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              alignment: Alignment(1.0, 1.0),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  _expression,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontSize: 48,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              alignment: Alignment(1.0, 1.0),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: 'AC',
                  fillColor: Colors.black54.value,
                  textSize: 20,
                  callback: allClear,
                ),
                CalcButton(
                  text: 'C',
                  fillColor: Colors.black54.value,
                  callback: clear,
                ),
                CalcButton(
                  text: '%',
                  fillColor: Colors.black.value,
                  textColor: Colors.white.value,
                  callback: numClick,
                ),
                CalcButton(
                  text: '/',
                  fillColor: Colors.black.value,
                  textColor: Colors.white.value,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '7',
                  textColor: Colors.black.value,
                  callback: numClick,
                ),
                CalcButton(
                  text: '8',
                  textColor: Colors.black.value,
                  callback: numClick,
                ),
                CalcButton(
                  text: '9',
                  textColor: Colors.black.value,
                  callback: numClick,
                ),
                CalcButton(
                  text: '*',
                  fillColor: Colors.black.value,
                  textColor: Colors.white.value,
                  textSize: 24,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: '4',
                  textColor: Colors.black.value,
                  callback: numClick,
                ),
                CalcButton(
                  text: '5',
                  textColor: Colors.black.value,
                  callback: numClick,
                ),
                CalcButton(
                  text: '6',
                  textColor: Colors.black.value,
                  callback: numClick,
                ),
                CalcButton(
                  text: '-',
                  fillColor: Colors.black.value,
                  textColor: Colors.white.value,
                  textSize: 38,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: '1',
                  textColor: Colors.black.value,
                  callback: numClick,
                ),
                CalcButton(
                  text: '2',
                  textColor: Colors.black.value,
                  callback: numClick,
                ),
                CalcButton(
                  text: '3',
                  textColor: Colors.black.value,
                  callback: numClick,
                ),
                CalcButton(
                  text: '+',
                  fillColor: Colors.black.value,
                  textColor: Colors.white.value,
                  textSize: 30,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: '.',
                  textColor: Colors.black.value,
                  callback: numClick,
                ),
                CalcButton(
                  text: '0',
                  textColor: Colors.black.value,
                  callback: numClick,
                ),
                CalcButton(
                  text: '00',
                  textColor: Colors.black.value,
                  callback: numClick,
                  textSize: 26,
                ),
                CalcButton(
                  text: '=',
                  fillColor: Colors.black.value,
                  textColor: Colors.white.value,
                  callback: evaluate,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
