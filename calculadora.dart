import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class FlatButtonx extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final EdgeInsets? padding;
  final Widget child;
  final double height;
  final double minWidth;
  FlatButtonx(
      {this.color = Colors.amber,
      required this.onPressed,
      this.padding,
      required this.child,
      required this.height,
      this.minWidth = 0});

  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child,
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Stateful Clicker Counter',
      theme: ThemeData(
        // Application theme data, you can set the colors for the application as
        // you want
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Clicker Counter Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the display (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String display = "0";
  String operacion = "";
  double num1 = 0;
  double num2 = 0;

  void setValue(String value) {
    setState(() {
      if (display == "0") {
        if (num1 == 0) {
          num1 = double.parse(value);
        } else {
          num1 = (num1 * 10) + double.parse(value);
        }
        display = value;
      } else {
        if (operacion != "") {
          if (num2 == 0) {
            num2 = double.parse(value);
          } else {
            num2 = (num2 * 10) + double.parse(value);
          }
        }

        display += (value);
      }
    });
  }

  void suma() {
    setState(() {
      num1 = double.parse(display);
      display = "$display + ";
      operacion = "suma";
    });
  }

  void resta() {
    setState(() {
      num1 = double.parse(display);
      display = "$display - ";
      operacion = "resta";
    });
  }

  void multiplicacion() {
    setState(() {
      num1 = double.parse(display);
      display = "$display x ";
      operacion = "multiplicacion";
    });
  }

  void division() {
    setState(() {
      num1 = double.parse(display);
      display = "$display / ";
      operacion = "division";
    });
  }

  void _cleardisplay() {
    setState(() {
      display = "0";
    });
  }

  void _changeSign() {
    setState(() {
      display = display.startsWith("-") ? display.substring(1) : "-$display";
    });
  }

  void porcentaje() {
    setState(() {
      double num = double.parse(display);
      display = (num / 100).toString();
    });
  }

  void igual() {
    setState(() {
      //double num2 = double.parse(display);
      if (operacion == "suma") {
        display = (num1 + num2).toString();
      } else if (operacion == "resta") {
        display = (num1 - num2).toString();
      } else if (operacion == "resta") {
        display = (num1 - num2).toString();
      } else if (operacion == "multiplicacion") {
        display = (num1 * num2).toString();
      } else if (operacion == "division") {
        display = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operacion = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        // Here we tak                                                                                                                                              e the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            child: Text(
              display,
              style: TextStyle(fontSize: 60, color: Colors.white),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
          Row(
            children: [
              FlatButtonx(
                color: Color(0xff3e3e3e),
                onPressed: _cleardisplay,
                padding: EdgeInsets.all(16),
                child: Text(
                  "AC",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                height: 70,
              ),
              FlatButtonx(
                color: Color(0xff3e3e3e),
                onPressed: _changeSign,
                padding: EdgeInsets.all(16),
                child: Text(
                  "+/-",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                height: 70,
              ),
              FlatButtonx(
                color: Color(0xff3e3e3e),
                onPressed: porcentaje,
                padding: EdgeInsets.all(16),
                child: Text(
                  "%",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                height: 70,
              ),
              FlatButtonx(
                color: Color(0xfffbb717),
                onPressed: division,
                padding: EdgeInsets.all(16),
                child: Text(
                  "/",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                height: 70,
              ),
            ],
          ),
          Row(
            children: [
              FlatButtonx(
                color: Color(0xff737373),
                onPressed: () => setValue("7"),
                padding: EdgeInsets.all(16),
                child: Text(
                  "7",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                height: 70,
              ),
              FlatButtonx(
                color: Color(0xff737373),
                onPressed: () => setValue("8"),
                padding: EdgeInsets.all(16),
                child: Text(
                  "8",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                height: 70,
              ),
              FlatButtonx(
                color: Color(0xff737373),
                onPressed: () => setValue("9"),
                padding: EdgeInsets.all(16),
                child: Text(
                  "9",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                height: 70,
              ),
              FlatButtonx(
                color: Color(0xfffbb717),
                onPressed: multiplicacion,
                padding: EdgeInsets.all(16),
                child: Text(
                  "x",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                height: 70,
              ),
            ],
          ),
          Row(
            children: [
              FlatButtonx(
                color: Color(0xff737373),
                onPressed: () => setValue("4"),
                padding: EdgeInsets.all(16),
                child: Text(
                  "4",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                height: 70,
              ),
              FlatButtonx(
                color: Color(0xff737373),
                onPressed: () => setValue("5"),
                padding: EdgeInsets.all(16),
                child: Text(
                  "5",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                height: 70,
              ),
              FlatButtonx(
                color: Color(0xff737373),
                onPressed: () => setValue("6"),
                padding: EdgeInsets.all(16),
                child: Text(
                  "6",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                height: 70,
              ),
              FlatButtonx(
                color: Color(0xfffbb717),
                onPressed: resta,
                padding: EdgeInsets.all(16),
                child: Text(
                  "-",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                height: 70,
              ),
            ],
          ),
          Row(
            children: [
              FlatButtonx(
                color: Color(0xff737373),
                onPressed: () => setValue("1"),
                child: Text(
                  "1",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                height: 70,
              ),
              FlatButtonx(
                color: Color(0xff737373),
                onPressed: () => setValue("2"),
                padding: EdgeInsets.all(16),
                child: Text(
                  "2",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                height: 70,
              ),
              FlatButtonx(
                color: Color(0xff737373),
                onPressed: () => setValue("3"),
                padding: EdgeInsets.all(16),
                child: Text(
                  "3",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                height: 70,
              ),
              FlatButtonx(
                color: Color(0xfffbb717),
                onPressed: suma,
                padding: EdgeInsets.all(16),
                child: Text(
                  "+",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                height: 70,
              ),
            ],
          ),
          Row(
            children: [
              FlatButtonx(
                color: Color(0xff737373),
                onPressed: () => setValue("0"),
                child: Text(
                  "0",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                height: 70,
                minWidth: 168,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff737373)),
                ),
                onPressed: () => setValue("."),
                child: Text(
                  ".",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              FlatButtonx(
                color: Color(0xfffbb717),
                onPressed: igual,
                padding: EdgeInsets.all(16),
                child: Text(
                  "=",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                height: 70,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
