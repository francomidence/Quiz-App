import "package:flutter/material.dart";

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result({this.resultScore, this.resetHandler});

  String get resultPhrase {
    var resultText = "You did it ^^ !";
    if (resultScore <= 8) {
      resultText = "You're nice :)";
    } else if (resultScore <= 15) {
      resultText = "Not bad :D";
    } else {
      resultText = ":0 so nice";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                fontFamily: "roboto"),
          ),
          FlatButton(
            child: Text("Restart quiz!"),
            onPressed: resetHandler,
            color: Colors.lightBlue,
          )
        ],
      ),
    );
  }
}
