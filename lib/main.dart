import 'package:flutter/material.dart';
import 'package:untitled1/src/widgets/list_products.dart';
import 'package:untitled1/src/widgets/widget.opcion01.dart';
import 'package:untitled1/src/widgets/widget.opcion02.dart';
import 'package:untitled1/src/widgets/widget.opcion03.dart';

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
        primarySwatch: Colors.red,
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
  //int _counter = 0;
  int _itemSeleccionado = 0;
  String title = 'Aplicaciones Moviles';

  static const TextStyle _optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _opcionesPantalla = <Widget>[
    Text('Aplicación de Inicio', style: _optionStyle),
    Text('Aplicación de Compartir', style: _optionStyle),
    Text('Aplicación de Salir', style: _optionStyle),
    Text('Aplicación de Inicio', style: _optionStyle)
  ];

  static const List<Widget> _content = <Widget>[
    formMensaje01(),
    formMensaje02(),
    ListProducts(),
  ];

  //void _incrementCounter() {
  //  setState(() {
  //    _counter++;
  //  });
  //}

  void _onItemTarget(int index) {
    //ONcLICK MENU
    setState(() {
      _itemSeleccionado = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        //child: _opcionesPantalla.elementAt(_itemSeleccionado),
        child: _content.elementAt(_itemSeleccionado),
      ),
      backgroundColor: Colors.white,
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: 'Compartir'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_business), label: 'Comprar'),
        ],
        currentIndex: _itemSeleccionado,
        selectedItemColor: Colors.red,
        onTap: _onItemTarget,
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.redAccent,
            ),
            child: Text('Menú de Opciones',
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Menu 1'),
            onTap: () {
              setState(() {
                _itemSeleccionado = 0;
                Navigator.pop(context, true);
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.memory),
            title: Text('Menu 2'),
            onTap: () {
              setState(() {
                _itemSeleccionado = 1;
                Navigator.pop(context, true);
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Menu 3'),
            onTap: () {
              setState(() {
                _itemSeleccionado = 2;
                Navigator.pop(context, true);
              });
            },
          ),
        ],
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
