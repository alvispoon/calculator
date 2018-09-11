import 'package:flutter/material.dart';


class HomePage extends StatefulWidget{
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{
  String  ansStr = "0";
  String  history = "";

  String output = "";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "+";
  bool showNewNumber = false;

  buttonPressed(String buttonText){
    //showNewNumber = true;
    if (buttonText == "C"){
      output = "";
      num1 = 0.0;
      num2 = 0.0;
      operand = "+";
      history = "";
      showNewNumber = false;
    }else if (buttonText == "+" || buttonText == "/" ||buttonText == "-" ||buttonText == "*" ||buttonText == "="){
      num2 = double.parse(output);
      if(operand == "+"){
        num1 = (num1 + num2);
      }
      if(operand == "-"){
        num1 = (num1 - num2);
      }
      if(operand == "*"){
        num1 = (num1 * num2);
      }
      if(operand == "/"){
        num1 = (num1 / num2);
      }
      num2 = 0.0;
      operand = buttonText;
      output = num1.toStringAsFixed(0);
      showNewNumber = true;
    }
    else if (showNewNumber){
      output = buttonText;
      showNewNumber = false;
    }
    else{
      output = output + buttonText;
    }
    setState(() {
      history = history + buttonText;
      if (output.length== 0) {
        ansStr = "0";
        if (buttonText == "C"){
          history = "";
        }
      }
      else {
        ansStr = output;
      }
      debugPrint (ansStr);
    });
  }


  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(30.0),
        child: new Text(buttonText,
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold
          ),
        ),
        onPressed: () =>
            buttonPressed(buttonText)
        ,
      ),
    );
  }


  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar:new AppBar(
        title: new Text("Calculator"),
      ),
      body: new Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
                constraints: BoxConstraints.expand(
                  height: Theme.of(context).textTheme.display1.fontSize +100.0,
                ),
                alignment:Alignment.centerRight,
              color: Colors.blueGrey,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "$history",
                    style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.grey
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    "$ansStr",
                    style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.blue
                    ),
                      textAlign: TextAlign.right,
                  )
                ],
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton("9"),
                buildButton("8"),
                buildButton("7"),
                buildButton("+")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton("6"),
                buildButton("5"),
                buildButton("4"),
                buildButton("-")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton("3"),
                buildButton("2"),
                buildButton("1"),
                buildButton("*")
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton("C"),
                buildButton("0"),
                buildButton("="),
                buildButton("/")
              ],
            )
          ]
        )
      )
    );

  }



}