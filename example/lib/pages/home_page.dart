import 'package:fintoc_example/pages/fintoc_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double amount = 5000.0;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Material(
          color: Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: SizedBox(
                  height: 50.0,
                  child: Image.asset(
                    'assets/images/watch.jpeg',
                  ),
                ),
                title: const Text('My fancy product'),
                subtitle: const Text('PRICE: 5.000 CLP'),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        ElevatedButton.icon(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FintocPage(
                  amount: amount,
                ),
              ),
            );
          },
          icon: Image.asset(
            'assets/images/fintoc_icon.png',
            height: 16.0,
          ),
          label: const Text(
            'PAGAR CON FINTOC',
          ),
        ),
      ],
    );
  }
}
