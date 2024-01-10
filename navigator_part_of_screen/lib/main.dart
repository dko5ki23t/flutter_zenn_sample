import 'package:flutter/material.dart';
import 'package:navigator_part_of_screen/color_page_navigator.dart';
import 'package:navigator_part_of_screen/color_page_switcher.dart';
import 'package:navigator_part_of_screen/icon_page_navigator.dart';
import 'package:navigator_part_of_screen/icon_page_switcher.dart';

const bool useNavigator = true;

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
      home: const MyHomePage(title: 'ボタン作成'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color buttonColor = Colors.blue;
  Icon buttonIcon = const Icon(Icons.add);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: useNavigator ?
              ColorPageNavigator(
                onSelect: (color) => setState(() {
                  buttonColor = color;
                },),
              ) :
              ColorPageSwitcher(
                onSelect: (color) => setState(() {
                  buttonColor = color;
                },),
              ),
            ),
            Expanded(
              child: useNavigator ?
              IconPageNavigator(
                onSelect: (icon) => setState(() {
                  buttonIcon = icon;
                }),
              ) :
              IconPageSwitcher(
                onSelect: (icon) => setState(() {
                  buttonIcon = icon;
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: buttonColor,
        child: buttonIcon,
      ),
    );
  }
}
