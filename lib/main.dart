import 'package:flutter/material.dart';
import 'todo_widget.dart';

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
  int _counter = 0;
  TextEditingController _inputController = TextEditingController();
  List<TodoModel> _todoItems = [
    TodoModel(text: 'My first item', completed: true),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                itemCount: _todoItems.length,
                itemBuilder: (context, index) {
                  return TodoWidget(
                    text: _todoItems[index].text,
                    completed: _todoItems[index].completed,
                    onChanged: (val) {
                      setState(() {
                        _todoItems[index].completed = val;
                      });
                    },
                  );
                },
              ),
              TextField(
                controller: _inputController,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _todoItems.add(
                      TodoModel(text: _inputController.text, completed: false),
                    );
                  });
                  _inputController.text = '';
                },
                child: Text('Add Item'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TodoModel {
  String text;
  bool completed;

  TodoModel({this.text = '', this.completed = false});
}
