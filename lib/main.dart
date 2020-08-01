import 'package:api_graphics/src/barras.dart';
import 'package:api_graphics/src/horizontal.dart';
import 'package:api_graphics/src/lineal.dart';
import 'package:api_graphics/src/pie.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Tipos de Graficas';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
      initialRoute: '/',
      routes: {
        '/home': (context)=>MyHomePage(),
        '/first':(context)=>FirstScreen(),
        '/second':(context)=>SecondScreen(),
        '/third':(context)=>ThirdScreen(),
        '/for':(context)=>ForScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('My Page!')),
      drawer: Drawer(
        
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Tipos de Graficas'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Barras'),
              onTap: () {

                Navigator.pushNamed(context,'/first');
              },
            ),
            ListTile(
              title: Text('Horizontal Barras'),
              onTap: () {
                Navigator.pushNamed(context,'/second');
              },
            ),
            ListTile(
              title: Text('Lineal'),
              onTap: () {
                Navigator.pushNamed(context,'/third');
              },
            ),
            ListTile(
              title: Text('Pastel'),
              onTap: () {
                Navigator.pushNamed(context,'/for');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Barras'),),
            body: BarrasScreen(),
         
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Horizontal Barras'),),
            body: BarrasHScreen(),
         
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Lineal'),),
            body: LinealScreen(),
         
    );
  }
}

class ForScreen extends StatelessWidget {
  const ForScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Pastel'),),
            body: PieScreen(),
         
    );
  }
}