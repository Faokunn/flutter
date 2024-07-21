import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController firstNumberController = TextEditingController();
  final TextEditingController secondNumberController = TextEditingController();
  String result = "";

  @override
  void dispose() {
    firstNumberController.dispose();
    secondNumberController.dispose();
    super.dispose();
  }

  void calculator(String calculation) {
    final firstNumber = double.tryParse(firstNumberController.text);
    final secondNumber = double.tryParse(secondNumberController.text);
    double operationResult = 0;

    if (firstNumber == null || secondNumber == null) {
      setState(() {
        result = "Invalid";
      });
      return;
    }

    switch (calculation) {
      case "+":
        operationResult = firstNumber + secondNumber;
        break;
      case "-":
        operationResult = firstNumber - secondNumber;
        break;
      case "/":
        if (firstNumber == 0 || secondNumber == 0) {
          setState(() {
            result = "Invalid";
          });
        }
        operationResult = firstNumber / secondNumber;
        break;
      case "*":
        operationResult = firstNumber * secondNumber;
        break;
      default:
        return;
    }
    setState(() {
      result = operationResult.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text("Assignment"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            alignment: Alignment.center,
            height: 250,
            width: 400,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 166, 169, 177),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Wrap(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Text(
                        "DIGI-CAL",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      InputFirstNumber(myController: firstNumberController),
                      const SizedBox(height: 10),
                      InputSecondNumber(myController: secondNumberController),
                      const SizedBox(height: 10),
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "RESULT: $result",
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.greenAccent,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      plusButton(onPressed: () => calculator("+")),
                      const SizedBox(height: 10),
                      MinusButton(onPressed: () => calculator("-")),
                      const SizedBox(height: 10),
                      DivideButton(onPressed: () => calculator("/")),
                      const SizedBox(height: 10),
                      MultiplyButton(onPressed: () => calculator("*")),
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class InputFirstNumber extends StatelessWidget {
  const InputFirstNumber({super.key, required this.myController});
  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200.0,
        child: Container(
          height: 50,
          child: TextField(
            controller: myController,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.greenAccent,
              fontFamily: 'monospace',
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black,
              hintText: "First Number",
              hintStyle: const TextStyle(
                color: Colors.greenAccent,
                fontFamily: 'monospace',
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
        ),
      ),
    );
  }
}

class InputSecondNumber extends StatelessWidget {
  const InputSecondNumber({super.key, required this.myController});
  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200.0,
        child: Container(
          height: 50,
          child: TextField(
            controller: myController,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.greenAccent,
              fontFamily: 'monospace',
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black,
              hintText: "Second Number",
              hintStyle: const TextStyle(
                color: Colors.greenAccent,
                fontFamily: 'monospace',
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
        ),
      ),
    );
  }
}

class plusButton extends StatefulWidget {
  const plusButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  State<plusButton> createState() => _plusButtonState();
}

class _plusButtonState extends State<plusButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(50, 50),
          textStyle: const TextStyle(fontSize: 20),
          backgroundColor: Color.fromARGB(255, 100, 100, 100),
          foregroundColor: const Color.fromARGB(255, 0, 0, 0)),
      onPressed: widget.onPressed,
      child: const Text("+"),
    );
  }
}

class MinusButton extends StatefulWidget {
  const MinusButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  State<MinusButton> createState() => _MinusButtonState();
}

class _MinusButtonState extends State<MinusButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(50, 50),
          textStyle: const TextStyle(fontSize: 20),
          backgroundColor: Color.fromARGB(255, 100, 100, 100),
          foregroundColor: const Color.fromARGB(255, 0, 0, 0)),
      onPressed: widget.onPressed,
      child: const Text("-"),
    );
  }
}

class DivideButton extends StatefulWidget {
  const DivideButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  State<DivideButton> createState() => _DivideButtonState();
}

class _DivideButtonState extends State<DivideButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(50, 50),
          textStyle: const TextStyle(fontSize: 20),
          backgroundColor: Color.fromARGB(255, 100, 100, 100),
          foregroundColor: const Color.fromARGB(255, 0, 0, 0)),
      onPressed: widget.onPressed,
      child: const Text("/"),
    );
  }
}

class MultiplyButton extends StatefulWidget {
  const MultiplyButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  State<MultiplyButton> createState() => _MultiplyButtonState();
}

class _MultiplyButtonState extends State<MultiplyButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(50, 50),
          textStyle: const TextStyle(fontSize: 20),
          backgroundColor: Color.fromARGB(255, 100, 100, 100),
          foregroundColor: const Color.fromARGB(255, 0, 0, 0)),
      onPressed: widget.onPressed,
      child: const Text("x"),
    );
  }
}
