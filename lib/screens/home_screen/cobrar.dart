import 'package:flutter/material.dart';
import 'package:pos/screens/payment/cash.dart';

class Cobrar extends StatefulWidget {
 const Cobrar({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CobrarState createState() =>  _CobrarState();
}

class _CobrarState extends State<Cobrar> {
  Cash uno;


  @override
  void initState() {
    uno = Cash();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 24.0),
            constraints: const BoxConstraints(maxHeight: 190.0),
            child: const Material(
              color: Colors.red,
              child: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.attach_money,
                      color: Colors.white,
                      size: 40.0
                    ),
                    text: 'Efectivo',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                uno,
              ],
            ),
          )
        ],
      ),
    );
  }
}