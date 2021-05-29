import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String output = "0", _output = "0", operand = "";
  double num1 = 0.0, num2 = 0.0;

  onButtonPressed(String buttonText) {
    if (buttonText == "CLR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "/") {
      num1 = double.parse(output);

      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        // already contains decimal value;
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(
      {String buttonText, Color textColor, Color buttonBackgroundColor}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onButtonPressed(buttonText);
        },
        child: Container(
          child: Card(
            color: buttonBackgroundColor == null
                ? Colors.white
                : buttonBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.0,
                    color: textColor == null ? Colors.black : textColor),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                decoration: BoxDecoration(
                  color: Color(0xffF0F2FE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  output,
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      buildButton(buttonText: "7"),
                      buildButton(buttonText: "8"),
                      buildButton(buttonText: "9"),
                      buildButton(
                        buttonText: "/",
                        textColor: Colors.white,
                        buttonBackgroundColor: Color(
                          0xff2cb9a9,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton(buttonText: "4"),
                      buildButton(buttonText: "5"),
                      buildButton(buttonText: "6"),
                      buildButton(
                        buttonText: "x",
                        textColor: Colors.white,
                        buttonBackgroundColor: Color(
                          0xff2cb9a9,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton(buttonText: "1"),
                      buildButton(buttonText: "2"),
                      buildButton(buttonText: "3"),
                      buildButton(
                        buttonText: "-",
                        textColor: Colors.white,
                        buttonBackgroundColor: Color(
                          0xff2cb9a9,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton(buttonText: "."),
                      buildButton(buttonText: "0"),
                      buildButton(buttonText: "00"),
                      buildButton(
                        buttonText: "+",
                        textColor: Colors.white,
                        buttonBackgroundColor: Color(
                          0xff2cb9a9,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton(
                        buttonText: "CLR",
                        textColor: Colors.white,
                        buttonBackgroundColor: Colors.red,
                      ),
                      buildButton(
                        buttonText: "=",
                        textColor: Colors.white,
                        buttonBackgroundColor: Color(
                          0xff2cb9a9,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
