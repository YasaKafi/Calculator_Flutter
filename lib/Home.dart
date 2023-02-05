import 'package:flutter/material.dart';
import 'package:mycalculator/buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(188, 237, 245, 1),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userQuestion,
                        style: TextStyle(fontSize: 20),
                      )),
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
                        style: TextStyle(fontSize: 20),
                      )),
                ],
              ),
            )),
            Expanded(
                flex: 2,
                child: Container(
                  child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      // mainAxisSpacing: 10,
                      // crossAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Mybutton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion = '';
                              userAnswer = '';
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.green,
                          textColor: Colors.white,
                        );
                      } else if (index == 1) {
                        return Mybutton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion = userQuestion.substring(
                                  0, userQuestion.length - 1, );
                              if(userQuestion.isEmpty){
                                userAnswer = '';
                              }
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.red,
                          textColor: Colors.white,
                        );
                      } else if (index == buttons.length - 1) {
                        return Mybutton(
                          buttonTapped: () {
                            setState(() {
                              equalPressed();
                            });
                          },
                          buttonText: buttons[index],
                          color: Color.fromRGBO(30, 177, 200, 1),
                          textColor: Colors.white,
                        );
                      }else if (index == buttons.length - 2){
                        return Mybutton(

                          buttonText: buttons[index],
                          color: Colors.white,
                          textColor: Color.fromRGBO(30, 177, 200, 1),
                        );
                      } else {
                        return Mybutton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion = userQuestion + buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Color.fromRGBO(30, 177, 200, 1)
                              : Color.fromRGBO(232, 249, 252, 1),
                          textColor: isOperator(buttons[index])
                              ? Colors.white
                              : Color.fromRGBO(30, 177, 200, 1),
                        );
                      }
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == ' % ' || x == ' / ' || x == ' x ' || x == ' - ' || x == ' + ' || x == ' = ') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double res = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = res.toString();

  }
}

// return Mybutton(
// buttonText: buttons[index],
// color: isOperator(buttons[index]) ? Color.fromRGBO(30, 177, 200, 1) : Color.fromRGBO(30, 177, 200, 0.50),
// textColor: isOperator(buttons[index]) ? Colors.white: Color.fromRGBO(30, 177, 200, 1),
// );
