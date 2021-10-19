import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './widgets/CalButton.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalApp());
}

class CalApp extends StatefulWidget {
  CalApp({Key? key}) : super(key: key);

  @override
  CalAppState createState() => CalAppState();
}

class CalAppState extends State<CalApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _expression = '';
      _history = '';
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
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Color(0xff3266a8),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Text(
                _history,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(fontSize: 18),
                  color: Colors.white,
                ),
              ),
              alignment: Alignment(1, 1),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                _expression,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(fontSize: 48),
                  color: Colors.white,
                ),
              ),
              alignment: Alignment(1, 1),
            ),
            SizedBox(height: 40),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalButton(
                    text: 'AC',
                    fillColor: 0xff6c807f,
                    textColor: 0xffd6a102,
                    callBack: allClear,
                  ),
                  CalButton(
                    text: 'C',
                    fillColor: 0xff6c807f,
                    textColor: 0xffffffff,
                    callBack: clear,
                  ),
                  CalButton(
                    text: '%',
                    fillColor: 0xffffffff,
                    textColor: 0xff777777,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '/',
                    fillColor: 0xffffffff,
                    textColor: 0xff777777,
                    callBack: numClick,
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalButton(
                    text: '7',
                    fillColor: 0xff3266a8,
                    textColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '8',
                    fillColor: 0xff3266a8,
                    textColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '9',
                    fillColor: 0xff3266a8,
                    textColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '*',
                    fillColor: 0xffffffff,
                    textColor: 0xff777777,
                    callBack: numClick,
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalButton(
                    text: '4',
                    fillColor: 0xff3266a8,
                    textColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '5',
                    fillColor: 0xff3266a8,
                    textColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '6',
                    fillColor: 0xff3266a8,
                    textColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '-',
                    fillColor: 0xffffffff,
                    textColor: 0xff777777,
                    callBack: numClick,
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalButton(
                    text: '1',
                    fillColor: 0xff3266a8,
                    textColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '2',
                    fillColor: 0xff3266a8,
                    textColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '3',
                    fillColor: 0xff3266a8,
                    textColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '+',
                    fillColor: 0xffffffff,
                    textColor: 0xff777777,
                    callBack: numClick,
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalButton(
                    text: '.',
                    fillColor: 0xff3266a8,
                    textColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '0',
                    fillColor: 0xff3266a8,
                    textColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '00',
                    fillColor: 0xff3266a8,
                    textColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalButton(
                    text: '=',
                    fillColor: 0xffffffff,
                    textColor: 0xff777777,
                    callBack: evaluate,
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
