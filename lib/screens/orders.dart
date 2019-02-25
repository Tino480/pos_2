import 'package:flutter/material.dart';
import 'package:pos/screens/home_screen/nuevaorden.dart';
import 'package:pos/screens/home_screen/cobrar.dart';
import 'package:pos/screens/home_screen/ordenpendiente.dart';

class Orders extends StatefulWidget {
  const Orders({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _OrdersState createState() =>  _OrdersState();
}

class _OrdersState extends State<Orders> {
  int currentTab = 1;
  NuevaOrden one;
  OrdenPendiente two;
  Cobrar three;
  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    one = NuevaOrden();
    two = OrdenPendiente();
    three = Cobrar();
    pages = [one, two, three];
    currentPage = pages[1];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: currentPage,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentTab,
            onTap: (int index) {
              setState(() {
                currentTab = index;
                currentPage = pages[index];
              });
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.fastfood), title: Text('Nueva orden')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('Ordenes Pendientes')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.monetization_on), title: Text('Cobrar')),
            ],
            fixedColor: Colors.red,
          ),
        );
  }
}
