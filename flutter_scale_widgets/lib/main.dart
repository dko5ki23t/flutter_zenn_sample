import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListViewWithViewItemCount(
          viewItemCount: 5,
          children: [
            for (final i in List.generate(30, (index) => index))
            ListTile(
              title: Text('item$i'),
              subtitle: Text('subtitile$i'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewWithViewItemCount extends StatelessWidget {
  const ListViewWithViewItemCount({
    super.key,
    required this.viewItemCount,
    required this.children,
  });
  final int viewItemCount;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView(
          itemExtent: constraints.maxHeight / viewItemCount,
          children: children,
        );
      },
    );
  }
}
