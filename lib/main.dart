import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(Object context) {
    return MaterialApp(
      title: 'Calculator',
      home: CalculatorClass(),
    );
  }
}

class CalculatorClass extends StatefulWidget {
  @override
  _CalculatorClassState createState() => _CalculatorClassState();
}

class _CalculatorClassState extends State<CalculatorClass> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  double num1 = 0;
  double num2 = 0;
  void createStateForTextLabel(String parameter) {
    if (parameter == "+" ||
        parameter == "/" ||
        parameter == "x" ||
        parameter == "-") {
      num1 = double.parse(controller1.text);
    }
    controller1.text += parameter;
  }

  void deleteCharacter() {
    if (controller1.text != null && controller1.text.length > 0) {
      controller1.text =
          controller1.text.substring(0, controller1.text.length - 1);
    }
  }

  void createStateForEqual() {
    //controller2
    String operation = "";
    String number2 = "";
    int len = 0;
    for (int i = 0; i < controller1.text.length; i++) {
      if (controller1.text[i] == "+" ||
          controller1.text[i] == "/" ||
          controller1.text[i] == "-" ||
          controller1.text[i] == "x") {
        operation += controller1.text[i];
        len = controller1.text.length - (i + 1);
        int j = i + 1;
        while (len != 0) {
          number2 += controller1.text[j];
          j++;
          len--;
        }
      }
    }
    num2 = double.tryParse(number2);

    controller2.text = "=";
    controller2.text += performOperation(operation).toString();
  }

  double performOperation(String operation) {
    double result;
    switch (operation) {
      case "+":
        {
          result = num1 + num2;
          break;
        }
      case "x":
        {
          result = num1 * num2;
          break;
        }
      case "/":
        {
          result = num1 / num2;
          break;
        }
      case "-":
        {
          result = num1 - num2;
          break;
        }
      default:
        print("Invalid Op");
        break;
    }
    return result;
  }

  void resetControler() {
    controller1.text = "";
    controller2.text = "";
  }

  Widget constructButton(
      Text text, Color culoare, VoidCallback onCustomButtonPressed) {
    return RaisedButton(
      child: text,
      color: culoare,
      disabledColor: culoare,
      onPressed: onCustomButtonPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator in Flutter'),
        ),
        body: Container(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                controller: controller1,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                controller: controller2,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(0.5),
                        child: constructButton(Text("C"), Colors.red[600], () {
                          resetControler();
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.5),
                        child: constructButton(Text("7"), Colors.grey, () {
                          createStateForTextLabel("7");
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.5),
                        child: constructButton(Text("4"), Colors.grey, () {
                          createStateForTextLabel("4");
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.5),
                        child: constructButton(Text("1"), Colors.grey, () {
                          createStateForTextLabel("1");
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.5),
                        child: constructButton(Text("."), Colors.grey, () {
                          createStateForTextLabel(".");
                        }),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(0.5),
                        child: RaisedButton(
                          child: Icon(Icons.backspace),
                          color: Colors.blue[600],
                          disabledColor: Colors.blue[600],
                          onPressed: () {
                            deleteCharacter();
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.5),
                        child: constructButton(Text("8"), Colors.grey, () {
                          createStateForTextLabel("8");
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.5),
                        child: constructButton(Text("5"), Colors.grey, () {
                          createStateForTextLabel("5");
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.5),
                        child: constructButton(Text("2"), Colors.grey, () {
                          createStateForTextLabel("2");
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.5),
                        child: constructButton(Text("0"), Colors.grey, () {
                          createStateForTextLabel("0");
                        }),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(0.5),
                        child: constructButton(Text("/"), Colors.blue[600], () {
                          createStateForTextLabel("/");
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.5),
                        child: constructButton(Text("9"), Colors.grey, () {
                          createStateForTextLabel("9");
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.5),
                        child: constructButton(Text("6"), Colors.grey, () {
                          createStateForTextLabel("6");
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.5),
                        child: constructButton(Text("3"), Colors.grey, () {
                          createStateForTextLabel("3");
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.5),
                        child: constructButton(Text("00"), Colors.grey, () {
                          createStateForTextLabel("00");
                        }),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(0.5),
                        child: constructButton(Text("x"), Colors.blue[600], () {
                          createStateForTextLabel("x");
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.5),
                        child: constructButton(Text("-"), Colors.blue[600], () {
                          createStateForTextLabel("-");
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.5, 0.5, 1, 6.5),
                        child: constructButton(Text("+"), Colors.blue[600], () {
                          createStateForTextLabel("+");
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.5, 0.5, 1, 5),
                        child: Container(
                          height: 87.0,
                          child: RaisedButton(
                            color: Colors.red[600],
                            disabledColor: Colors.red[600],
                            child: Text('='),
                            onPressed: () {
                              createStateForEqual();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
