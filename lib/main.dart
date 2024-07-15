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

  @override
  void dispose() {
    firstNumberController.dispose();
    secondNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignemnt"),
        backgroundColor: Colors.blue,
        ),
      body: Container(
        color: Colors.yellow,
        child: Center(child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InputFirstNumber(myController: firstNumberController),
              const SizedBox(height: 10),
              InputSecondNumber(myController: secondNumberController),
              const SizedBox(height: 10),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  plusButton(x: int.parse(firstNumberController.text),y: int.parse(secondNumberController.text)),
                  const SizedBox(width: 10,),
                  MinusButton(x: int.parse(firstNumberController.text),y: int.parse(secondNumberController.text)),
                  const SizedBox(width: 10,),
                  DivideButton(x: int.parse(firstNumberController.text),y: int.parse(secondNumberController.text)),
                  const SizedBox(width: 10,),
                  MultiplyButton(x: int.parse(firstNumberController.text),y: int.parse(secondNumberController.text)),
                ],),
              const Text(
                "RESULT: ",
                style: TextStyle(fontSize: 50),
                )
              ]
            ),
          )
        ),

    );
  }
}

class InputFirstNumber extends StatefulWidget {
  const InputFirstNumber({super.key, required this.myController});
  final TextEditingController myController;

  @override
  State<InputFirstNumber> createState() => _InputFirstNumberState();
}

class _InputFirstNumberState extends State<InputFirstNumber> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200.0, 
        child: 
          TextField(
            controller: widget.myController,            
            textAlign: TextAlign.center, 
            keyboardType: const TextInputType.numberWithOptions(decimal: true) ,
            decoration: const InputDecoration(alignLabelWithHint: null, hintText: "First Number",border: OutlineInputBorder()),
        ),
      ),
    );
  }
}

class InputSecondNumber extends StatefulWidget {
  const InputSecondNumber({super.key, required this.myController});
  final TextEditingController myController;

  @override
  State<InputSecondNumber> createState() => _InputSecondNumberState();
}

class _InputSecondNumberState extends State<InputSecondNumber> {
  @override
  Widget build(BuildContext context) {
    return Center(
      
      child: SizedBox(
        width: 200.0, 
        child: 
          TextField(
            controller: widget.myController,
            textAlign: TextAlign.center, 
            keyboardType: const TextInputType.numberWithOptions(decimal: true) ,
            decoration: const InputDecoration(alignLabelWithHint: null, hintText: "Second Number",border: OutlineInputBorder()),
        ),
      ),
    );
  }
}

class plusButton extends StatefulWidget {
  const plusButton({super.key, required this.x, required this.y});
  final int x;
  final int y;
  

  @override
  State<plusButton> createState() => _plusButtonState();
}

class _plusButtonState extends State<plusButton> {

  void plusButton() {
    
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(50, 50),
        textStyle: const TextStyle(fontSize: 20),
        backgroundColor: Colors.red,
        foregroundColor: Colors.black
      ), onPressed: () {  }, 
      child: const Text("+"),);
  }
}

class MinusButton extends StatefulWidget {
  const MinusButton({super.key, required this.x, required this.y});
  final int x;
  final int y;

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
        backgroundColor: Colors.red,
        foregroundColor: Colors.black
      ), onPressed: () {  }, 
      child: const Text("-"),);
  }
}

class DivideButton extends StatefulWidget {
  const DivideButton({super.key, required this.x, required this.y});
  final int x;
  final int y;

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
        backgroundColor: Colors.red,
        foregroundColor: Colors.black
      ), onPressed: () {  }, 
      child: const Text("/"),);
  }
}

class MultiplyButton extends StatefulWidget {
  const MultiplyButton({super.key, required this.x, required this.y});
  final int x;
  final int y;

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
        backgroundColor: Colors.red,
        foregroundColor: Colors.black
      ), onPressed: () {  }, 
      child: const Text("x"),);
  }
}

/*class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
            color: Colors.amber,
            child: const Column(
              children: <Widget>[
                TextInput(),
                Row(
                  children: <Widget>[Text("Hello")],
                ),
                Row(
                  children: <Widget>[Text("Hello")],
                ),
                Row(
                  children: <Widget>[Text("Hello")],
                )
              ],
            )));
  }
}*/


/*class _TextInputState extends State<TextInput> {
  final TextEditingController controller = TextEditingController();
  String text2 = "";
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void changeText(text) {
    if (text == "hatdog") {
      controller.clear();
      text = "bbb";
    }
    setState(() {
      text2 = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.numbers),
            labelText: "Input Number",
          ),
          onChanged: (text) => changeText(text),
        ),

        Text(text2), // Display the current input text
      ],
    );
  }
}*/
