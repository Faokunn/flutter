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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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
}

class TextInput extends StatefulWidget {
  const TextInput({super.key});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
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
}
