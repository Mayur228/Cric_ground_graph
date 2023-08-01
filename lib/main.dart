import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
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

  void _incrementCounter() {
    setState(() {
      _counter++;
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /* const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),*/
            CustomPaint(
              painter: GroundGraph(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class GroundGraph extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center = size / 2;
    var paint = Paint()..color = Colors.greenAccent;
    var paint2 = Paint()..color = Colors.black12;
    var paint3 = Paint()..color = Colors.yellow;
    var paint4 = Paint()..color = Colors.white;
    Paint whiteLine = Paint();
    whiteLine.strokeWidth = 2;
    whiteLine.color = Colors.white;

    Paint yellowLine = Paint();
    yellowLine.strokeWidth = 2;
    yellowLine.color = Colors.amber;

    Paint purpleLine = Paint();
    purpleLine.strokeWidth = 2;
    purpleLine.color = Colors.purpleAccent;

    Paint greenLine = Paint();
    greenLine.strokeWidth = 2;
    greenLine.color = Colors.green;

    Paint blueLine = Paint();
    blueLine.strokeWidth = 2;
    blueLine.color = Colors.blue;

    Paint deepPurpleLine = Paint();
    deepPurpleLine.strokeWidth = 2;
    deepPurpleLine.color = Colors.deepPurple;

    canvas.drawCircle(Offset(center.width, center.height), 130.0, paint);

    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
              center: Offset(center.width, center.height),
              width: 100,
              height: 150),
          const Radius.circular(100),
        ),
        paint2);

    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(center.width, center.height), width: 30, height: 75),
        paint3);

    canvas.drawLine(Offset(0, -20), Offset(100, 0), whiteLine);
    canvas.drawLine(Offset(0, -20), Offset(30, 130), yellowLine);
    canvas.drawLine(Offset(0, -20), Offset(10, 100), purpleLine);
    canvas.drawLine(Offset(0, -20), Offset(50, 50), greenLine);
    canvas.drawLine(Offset(0, -20), Offset(100, 70), blueLine);
    canvas.drawLine(Offset(0, -20), Offset(50, 5), deepPurpleLine);

    canvas.drawCircle(Offset(center.width, -20), 5.0, paint4);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
