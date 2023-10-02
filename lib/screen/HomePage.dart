import 'package:flutter/material.dart';

import '../model/class.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _CalcultorAppState();
}

class _CalcultorAppState extends State<HomePage> {
  var question = "";
  var answer = "";
  var isOperator = "";
  num firstValue = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: _buildBody,
        ));
  }

  get _buildBody {
    return Column(
      children: [
        Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                alignment: Alignment.topRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        child: Text(
                            answer,
                            style: TextStyle(fontSize: 50,
                                color: Colors.white)
                        )
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        child: Text(
                            question,
                            style: TextStyle(fontSize: 50,
                                color: Colors.white)
                        )
                    )
                  ],
                ),
              ),
            )),
        Expanded(
            flex: 3,
            child: GridView(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              children: [
                CircleButton(
                    lable: "C",
                    color: Colors.grey[700],
                    textColors: Colors.black,
                    onTap: () {
                      setState(() {
                        question = "";
                        isOperator = "";
                        answer = "";
                      });
                    }),
                CircleButton(
                    lable: "+/-",
                    color: Colors.grey[700],
                    textColors: Colors.black,
                    onTap: () {
                      setState(() {
                        try {
                          if (question.contains("."))
                            question = (double.parse(question) * -1).toString();
                          else
                            question = (int.parse(question) * -1).toString();
                        } catch (e) {
                          print(e);
                        }
                      });
                    }),
                CircleButton(
                    lable: "%",
                    color: Colors.grey[700],
                    textColors: Colors.black,
                    onTap: () {
                      setState(() {
                        try {
                          if (question.contains("."))
                            question = (double.parse(question) / 100)
                                .toString();
                          else {
                            num reminder = num.parse(question) % 100;
                            if (reminder == 0)
                              question = (num.parse(question) / 100)
                                  .ceil()
                                  .toString();
                            else
                              question = (num.parse(question) / 100).toString();
                          }
                        } catch (e) {
                          print(e);
                        }
                      });
                    }),
                CircleButton(
                    lable: "/",
                    color: isOperator == "/" ? Colors.white : Color.fromARGB(
                        255, 255, 191, 0),
                    textColors: isOperator == "/" ? Colors.black : Colors.white,
                    onTap: () {
                      setState(() {
                        isOperator = '/';
                        passToOldValue();
                      });
                    }),
                CircleButton(
                    lable: "7",
                    color: Colors.grey[700],
                    textColors: Colors.black,
                    onTap: () {
                      presseButton("7");
                    }),
                CircleButton(
                    lable: "8",
                    color: Colors.grey[700],
                    textColors: Colors.black,
                    onTap: () {
                      presseButton("8");
                    }),
                CircleButton(
                    lable: "9",
                    color: Colors.grey[700],
                    textColors: Colors.black,
                    onTap: () {
                      presseButton("9");
                    }),
                CircleButton(
                    lable: "x",
                    color: isOperator == "*" ? Colors.white : Color.fromARGB(
                        255, 255, 191, 0),
                    textColors: isOperator == "*" ? Colors.black : Colors.white,
                    onTap: () {
                      setState(() {
                        isOperator = '*';
                        passToOldValue();
                      });
                    }
                ),
                CircleButton(
                    lable: "4",
                    color: Colors.grey[700],
                    textColors: Colors.black,
                    onTap: () {
                      presseButton("4");
                    }
                ),
                CircleButton(
                    lable: "5",
                    color: Colors.grey[700],
                    textColors: Colors.black,
                    onTap: () {
                      presseButton("5");
                    }
                ),
                CircleButton(
                    lable: "6",
                    color: Colors.grey[700],
                    textColors: Colors.black,
                    onTap: () {
                      presseButton("6");
                    }
                ),
                CircleButton(
                    lable: "-",
                    color: isOperator == "-" ? Colors.white : Color.fromARGB(
                        255, 255, 191, 0),
                    textColors: isOperator == "-" ? Colors.black : Colors.white,
                    onTap: () {
                      setState(() {
                        isOperator = '-';
                        passToOldValue();
                      });
                    }
                ),
                CircleButton(
                    lable: "1",
                    color: Colors.grey[700],
                    textColors: Colors.black,
                    onTap: () {
                      presseButton("1");
                    }
                ),
                CircleButton(
                    lable: "2",
                    color: Colors.grey[700],
                    textColors: Colors.black,
                    onTap: () {
                      presseButton("2");
                    }
                ),
                CircleButton(
                    lable: "3",
                    color: Colors.grey[700],
                    textColors: Colors.black,
                    onTap: () {
                      presseButton("3");
                    }
                ),
                CircleButton(
                    lable: "+",
                    color: isOperator == "+" ? Colors.white : Color.fromARGB(
                        255, 255, 191, 0),
                    textColors: isOperator == "+" ? Colors.black : Colors.white,
                    onTap: () {
                      setState(() {
                        isOperator = "+";
                        passToOldValue();
                      });
                    }
                ),
                CircleButton(
                    lable: "0",
                    color: Colors.grey[700],
                    textColors: Colors.black,
                    onTap: () {
                      presseButton("0");
                    }
                ),
                CircleButton(
                    lable: "00",
                    color: Colors.grey[700],
                    textColors: Colors.black,
                    onTap: () {
                      presseButton("00");
                    }
                ),
                CircleButton(
                    lable: ".",
                    color: Colors.grey[700],
                    textColors: Colors.black,
                    onTap: () {
                      presseButton(".");
                    }
                ),
                CircleButton(
                    lable: "=",
                    color: Color.fromARGB(255, 255, 191, 0),
                    textColors: Colors.white,
                    onTap: () {
                      calculation();
                    }
                )

              ],
            ))
      ],
    );
  }

  void passToOldValue() {
    try {
      answer = question;
      firstValue = double.parse(question);
      question = "";
    } catch (e) {
      firstValue = 0;
    }
  }

  void calculation() {
    setState(() {
      try {
        num second = double.parse(question);
        num result = 0;
        switch (isOperator) {
          case '+':
            result = firstValue + second;
            break;
          case '-':
            result = firstValue - second;
            break;
          case '*':
            result = firstValue * second;
            break;
          case '/':
            result = firstValue / second;
            break;
        }
        question = result.ceil().toString();
        isOperator = "";
        firstValue = 0;
        answer = "";
      } catch (e) {
        question = "";
        isOperator = "";
        firstValue = 0;
        answer = "";
      }
    });
  }

  void presseButton(val) {
    setState(() {
      if (question.length == 0) {
        question = "";
        if (val == '.')
          question = "0.";
        else if (val == '00') question = "";
        //else if(val == '0') question = "";
        else
          question = val;
      } else {
        if (question.length == 1 && question.contains("0"))
          question = val;
        else
          question += val;
      }
    });
  }
}


