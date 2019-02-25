import 'package:flutter/material.dart';
import 'package:pos/screens/new_orders/promociones.dart';
import 'package:pos/screens/new_orders/pizza.dart';
import 'package:pos/screens/new_orders/alitas.dart';
import 'package:pos/screens/new_orders/refresco.dart';
import 'package:pos/screens/new_orders/postre.dart';

class NuevaOrden extends StatefulWidget {
  const NuevaOrden({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _NuevaOrdenState createState() => _NuevaOrdenState();
}

class _NuevaOrdenState extends State<NuevaOrden> {
  Promociones uno;
  Pizza dos;
  Alitas tres;
  Refresco cuatro;
  Postre cinco;

  @override
  void initState() {
    uno = Promociones();
    dos = Pizza();
    tres = Alitas();
    cuatro = Refresco();
    cinco = Postre();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 24.0),
            constraints: const BoxConstraints(maxHeight: 100.0),
            child: const Material(
              color: Colors.red,
              child: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      IconData(0xe91a, fontFamily: 'icomoon'),
                      color: Colors.white,
                      size: 40.0,
                    ),
                    text: 'Promociones',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.local_pizza,
                      color: Colors.white,
                      size: 40.0,
                    ),
                    text: 'Pizza',
                  ),
                  Tab(
                    icon: Icon(
                      IconData(0xe902, fontFamily: 'icomoon'),
                      color: Colors.white,
                      size: 40.0,
                    ),
                    text: 'Alitas',
                  ),
                  Tab(
                    icon: Icon(
                      IconData(0xe900, fontFamily: 'icomoon'),
                      color: Colors.white,
                      size: 40.0,
                    ),
                    text: 'Refrescos',
                  ),
                  Tab(
                    icon: Icon(
                      IconData(0xe901, fontFamily: 'icomoon'),
                      color: Colors.white,
                      size: 40.0,
                    ),
                    text: 'Postres',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                uno,
                dos,
                tres,
                cuatro,
                cinco,
              ],
            ),
          )
        ],
      ),
    );
  }
}
