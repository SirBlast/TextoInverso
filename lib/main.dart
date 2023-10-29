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
      title: 'Texto Inverso',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Texto Inverso'),
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
  String _textoOriginal = '';
  String _textoInverso = '';

  void _revertirTexto(String text) {
    setState(() {
      _textoOriginal= text;
      _textoInverso= text.split('').reversed.join();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 30,vertical: 0),
        child:Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                onChanged: (text) => _revertirTexto(text),
                decoration:InputDecoration(labelText: 'Ingresa un texto',
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              Text(
                'Texto Original: $_textoOriginal',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Texto Reverso: $_textoInverso',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      )

    );
  }
}
