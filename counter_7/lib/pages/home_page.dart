import 'package:counter_7/pages/form_page.dart';
import 'package:counter_7/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isGenap = true;
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
      if (_counter % 2 == 0) {
        isGenap = true;
      } else {
        isGenap = false;
      }
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
      if (_counter % 2 == 0) {
        isGenap = true;
      } else {
        isGenap = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Program Counter"),
        ),
        drawer: DrawerWidget(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              isGenap
                  ? const Text('GENAP',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))
                  : const Text("GANJIL",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
              Text(
                '$_counter',
                style: const TextStyle(fontSize: 40.0),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(24.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _counter <= 0
                ? const Text("")
                : FloatingActionButton(
                    onPressed: _decrement,
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
            FloatingActionButton(
              onPressed: _increment,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            )
          ]),
        ));
  }
}
