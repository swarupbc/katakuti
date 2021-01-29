import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:katakuti/about.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool yourTurn = true;
  List<String> displayXO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  var myTextStyle = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  );
  var numberStyle = TextStyle(
    fontSize: 20.0,
  );
  var nextTurn = TextStyle(
    fontSize: 20.0,
  );
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'K',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 50.0,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
                fontFamily: 'dancing',
              ),
            ),
            Text(
              'ata',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                fontFamily: 'dancing',
              ),
            ),
            Text(
              'K',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 50.0,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
                fontFamily: 'dancing',
              ),
            ),
            Text(
              'uti',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                fontFamily: 'dancing',
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutPage()));
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.help,
                  color: Colors.grey,
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Player O',
                          style: myTextStyle,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          oScore.toString(),
                          style: numberStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Player X',
                          style: myTextStyle,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          xScore.toString(),
                          style: numberStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                        print(displayXO);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[600]),
                        ),
                        child: Center(
                          child: Text(
                            displayXO[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Expanded(
              child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: yourTurn
                    ? Text(
                        "O's Turn",
                        style: nextTurn,
                      )
                    : Text("X's Turn", style: nextTurn),
              ),
            ],
          )),
        ],
      ),
    ));
  }

  void _tapped(int index) {
    setState(() {
      if (yourTurn && displayXO[index] == '') {
        displayXO[index] = 'o';
        filledBoxes += 1;
        yourTurn = !yourTurn;
        _checkWinner();
      } else if (!yourTurn && displayXO[index] == '') {
        displayXO[index] = 'x';
        filledBoxes += 1;
        yourTurn = !yourTurn;
        _checkWinner();
      }
    });
  }

  void _checkWinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      return _showDialouge(displayXO[0]);
    }

    // checks 2nd row
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      return _showDialouge(displayXO[3]);
    }

    // checks 3rd row
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      return _showDialouge(displayXO[6]);
    }

    // checks 1st column
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      return _showDialouge(displayXO[0]);
    }

    // checks 2nd column
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      return _showDialouge(displayXO[1]);
    }

    // checks 3rd column
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      return _showDialouge(displayXO[2]);
    }

    // checks diagonal
    if (displayXO[6] == displayXO[4] &&
        displayXO[6] == displayXO[2] &&
        displayXO[6] != '') {
      return _showDialouge(displayXO[6]);
    }

    // checks diagonal
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      return _showDialouge(displayXO[0]);
    } else if (filledBoxes == 9) {
      _showDrawDialouge();
    }
  }

  void _showDrawDialouge() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Game Draw'),
            actions: [
              FlatButton(
                color: Colors.green,
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text('Play Again'),
              )
            ],
          );
        });
  }

  void _showDialouge(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('The Winner is - Player ' + winner),
            actions: [
              FlatButton(
                color: Colors.green,
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text('Play Again'),
              )
            ],
          );
        });
    if (winner == 'o') {
      oScore += 1;
    } else if (winner == 'x') {
      xScore += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
    });
    filledBoxes = 0;
  }
}
