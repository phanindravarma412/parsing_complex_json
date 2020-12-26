import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './model/sample.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.orangeAccent,
        primarySwatch: Colors.red,
      ),
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String jsonContent = '';

  Future loadSampleJson() async {
    String jsonString = await rootBundle.loadString('assets/sample.json');
    print('************* JSON STRING ******************');
    print(jsonString);
    final jsonData = json.decode(jsonString);
    print('************* JSON DATA ******************');
    print(jsonData);

    Sample sample = Sample.fromJson(jsonData);

    print('***************** SAMPLE **************');
    print(sample);

    setState(() {
      jsonContent = sample.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON Parsing'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      // TODO: do something in here
                      loadSampleJson();
                    },
                    child: Text("Read JSON File"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  jsonContent,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
