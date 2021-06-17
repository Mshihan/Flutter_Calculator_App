import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Constants.dart';
import 'NumberButton.dart';
import 'OperatorButton.dart';
import 'OperationNumberPlate.dart';
import 'Operations.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MyApp(),
  );
}

enum Operator {
  divide,
  add,
  multiply,
  subtract,
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<int> number = [];
  int current = 0;
  String megaNo = '0';
  String lastNo = '0';
  String operation;
  IconData passingOperation;
  Operator selectOperator;
  Color operatorIconColor;

  void setNo(String searchNumber) {
    setState(() {
      megaNo == '0' ? megaNo = searchNumber : megaNo = megaNo + searchNumber;
    });
  }

  void settingValues(IconData icon, Color colour) {
    setState(() {
      lastNo = megaNo;
      megaNo = '0';
      passingOperation = icon;
      operatorIconColor = colour;
    });
  }

  checkDecimals(double temp) {
    var tempMega = temp.floor();
    if ((double.parse(megaNo) - tempMega) == 0.00) {
      megaNo = tempMega.floor().toString();
    }
  }

  void checkOperation() {
    double tempMega;
    setState(() {
      if (selectOperator == Operator.divide) {
        var first = double.parse(lastNo);
        var second = double.parse(megaNo);
        megaNo = divide(first, second).toStringAsFixed(3);
        lastNo = '0';
        tempMega = divide(first, second);
        checkDecimals(tempMega);
      } else if (selectOperator == Operator.multiply) {
        var first = double.parse(lastNo);
        var second = double.parse(megaNo);
        megaNo = multiply(first, second).toStringAsFixed(3);
        tempMega = multiply(first, second);
        lastNo = '0';
        checkDecimals(tempMega);
      } else if (selectOperator == Operator.add) {
        var first = double.parse(lastNo);
        var second = double.parse(megaNo);
        megaNo = add(first, second).toStringAsFixed(3);
        lastNo = '0';
        tempMega = add(first, second);
        checkDecimals(tempMega);
      } else if (selectOperator == Operator.subtract) {
        var first = double.parse(lastNo);
        var second = double.parse(megaNo);
        megaNo = subtract(first, second).toStringAsFixed(3);
        lastNo = '0';
        tempMega = subtract(first, second);
        checkDecimals(tempMega);
      }
    });
  }

  void setColorOperator() {
    operatorIconColor = kNumberBoard;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        backgroundColor: kBackgroundCal,
        primaryColor: kBackgroundCal,
        accentColor: kBackgroundCal,
        scaffoldBackgroundColor: kBackgroundCal,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Calculator'.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: kNumberBoard,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            OperatorNumberPlate(
                              operator: passingOperation,
                              colour: operatorIconColor,
                            ),
                            Expanded(
                              flex: 8,
                              child: Container(
                                padding: EdgeInsets.only(right: 3),
                                child: Text(
                                  lastNo.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                alignment: Alignment.topRight,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              megaNo,
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 60,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: NumberButton(
                          onPressed: () {
                            setNo('7');
                          },
                          number: 7,
                        ),
                      ),
                      Container(
                        child: NumberButton(
                          onPressed: () {
                            setNo('8');
                          },
                          number: 8,
                        ),
                      ),
                      Container(
                        child: NumberButton(
                          onPressed: () {
                            setNo('9');
                          },
                          number: 9,
                        ),
                      ),
                      Container(
                        child: OperatorButton(
                          onPressed: () {
                            selectOperator = Operator.divide;
                            settingValues(
                                FontAwesomeIcons.divide, kActiveOperator);
                          },
                          operator: Icon(
                            FontAwesomeIcons.divide,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: NumberButton(
                          onPressed: () {
                            setNo('4');
                          },
                          number: 4,
                        ),
                      ),
                      Container(
                        child: NumberButton(
                          onPressed: () {
                            setNo('5');
                          },
                          number: 5,
                        ),
                      ),
                      Container(
                        child: NumberButton(
                          onPressed: () {
                            setNo('6');
                          },
                          number: 6,
                        ),
                      ),
                      Container(
                        child: OperatorButton(
                          onPressed: () {
                            selectOperator = Operator.subtract;
                            settingValues(
                                FontAwesomeIcons.minus, kActiveOperator);
                          },
                          operator: Icon(
                            FontAwesomeIcons.minus,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: NumberButton(
                          onPressed: () {
                            setNo('1');
                          },
                          number: 1,
                        ),
                      ),
                      Container(
                        child: NumberButton(
                          onPressed: () {
                            setNo('2');
                          },
                          number: 2,
                        ),
                      ),
                      Container(
                        child: NumberButton(
                          onPressed: () {
                            setNo('3');
                          },
                          number: 3,
                        ),
                      ),
                      Container(
                        child: OperatorButton(
                          onPressed: () {
                            selectOperator = Operator.add;
                            settingValues(FontAwesomeIcons.plus, kActiveOperator);
                          },
                          operator: Icon(
                            FontAwesomeIcons.plus,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: MaterialButton(
                          color: Color(0x65453e4c),
                          onPressed: () {
                            setState(() {
                              megaNo = '0';
                              lastNo = '0';
                              settingValues(FontAwesomeIcons.bold, kNumberBoard);
                            });
                          },
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(30),
                          highlightColor: Color(0xFFFF0066),
                          colorBrightness: Brightness.dark,
                          child: Text(
                            'CE',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        child: NumberButton(
                          onPressed: () {
                            setNo('0');
                          },
                          number: 0,
                        ),
                      ),
                      Container(
                        child: OperatorButton(
                          operator: Icon(
                            Icons.fiber_manual_record,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setNo('.');
                          },
                        ),
                      ),
                      Container(
                        child: Container(
                          child: OperatorButton(
                            onPressed: () {
                              setState(() {
                                if (double.parse(megaNo) != 0) {
                                  selectOperator = Operator.multiply;
                                  settingValues(
                                      FontAwesomeIcons.times, kActiveOperator);
                                }
                              });
                            },
                            operator: Icon(
                              FontAwesomeIcons.times,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            checkOperation();
                            setColorOperator();
                            lastNo = '0';
                          },
                          child: Container(
                            child: Text(
                              'CALCULATE',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 25,
                              horizontal: 25,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFFF0066),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            megaNo == '0' ? lastNo = '0' : megaNo = '0';
                            if (lastNo == '0') {
                              setColorOperator();
                            }
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Icon(
                            FontAwesomeIcons.backspace,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
