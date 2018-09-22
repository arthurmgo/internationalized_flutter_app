import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:async';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en', 'US'), 
        const Locale('pt', 'BR'), 
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  DateTime _date = new DateTime.now();

  Future<Null> _selectDate(BuildContext context) async{
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: new DateTime(2016),
      lastDate: new DateTime(2019),
      locale: Localizations.localeOf(context)
    );

    if(picked != null && picked != _date){
      print('Data selecionada: ${_date.toString()}');
      setState(() {
              _date = picked;
            });
    }
  }



  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: RaisedButton(
          child: Text('DatePicker'),
          onPressed:() => _selectDate(context),
        )
      ),
    );
  }
}
