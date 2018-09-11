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
  String operand = "";

  buttonPressed(String buttonText){

    if (buttonText == "C"){
      output = "";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
      history = "";
    }else if (buttonText == "+" || buttonText == "/" ||buttonText == "-" ||buttonText == "*" ){




      num1 = double.parse(output);
      operand = buttonText;
      output = "";
    }else if (buttonText == "="){
      num2 = double.parse(output);
      if(operand == "+"){
        output = (num1 + num2).toStringAsFixed(0);
      }
      if(operand == "-"){
        output = (num1 - num2).toStringAsFixed(0);
      }
      if(operand == "X"){
        output = (num1 * num2).toStringAsFixed(0);
      }
      if(operand == "/"){
        output = (num1 / num2).toStringAsFixed(0);
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }
    else {
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
                children: <Widget>[
                  Text(
                    "$history",
                    style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.grey
                    ),
                  ),
                  Text(
                    "$ansStr",
                    style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.blue
                    ),
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
  Widget _button(String number, Function() f){
    return MaterialButton(
        height: 100.0,
        child: Text(number,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
        textColor: Colors.black,
        color: Colors.grey[100],
        onPressed: f,
    );
  }


}