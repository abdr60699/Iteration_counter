import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Iteration Counter'),
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
  String? result;

  TextEditingController number = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController limit = TextEditingController();

  iteration(n, q, l) {
    var total = n ~/ q;

    if (total <= l) {
      _counter++;
      setState(() {
        result = _counter.toString();
      });
      _counter = 0;
    } else if (total > l) {
      _counter += 1;
      iteration(total, q, l);
    }
  }

  @override
  void dispose() {
    super.dispose();
    number.clear();
    quantity.clear();
    limit.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedTextKit(isRepeatingAnimation: true, animatedTexts: [
              WavyAnimatedText('Ilailabs',
                  textStyle: TextStyle(
                      fontSize: 30, color: Theme.of(context).primaryColor))
            ]),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
              keyboardType: TextInputType.number,
              controller: number,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "quantity",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
              keyboardType: TextInputType.number,
              controller: quantity,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "limit",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
              keyboardType: TextInputType.number,
              controller: limit,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  iteration(double.parse(number.text),
                      double.parse(quantity.text), double.parse(limit.text));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: Text('Calculate')),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(5)),
              height: 40,
              width: 100,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Iteration = ${result ?? 0}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
